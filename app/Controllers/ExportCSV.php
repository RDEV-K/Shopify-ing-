<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class ExportCSV extends BaseController
{
    
    public function exportcsv($rawData) {
        // dd($rawData);
        extract($rawData);
        $data['data'] = $data;
        $data['headers'] = $header;
        $data['title'] = $title;
        $data['url'] = $url;
        $data['id'] = $id;
        $data['headerInfo'] = $headerInfo ?? null;
        return view('pages/exportcsv', $data);
    }


    /**
     * Set Excel file name
     *
     * @var string
     */
    public $filename = 'excel-doc';

    /**
     * Set Excel field title
     *
     * @var string
     */
    public $custom_titles;

    /**
     * Get JSON data and convert in Excel file
     */
    public function testing () {
        return view('pages/testing');
    }

    public function saveAsExcel() {
        $CSV = trim ( $_POST ['exportdata'] );
        dd($CSV);
        if (function_exists ( 'json_decode' )) {
            $data = json_decode ( $CSV, true );
            if (count ( $data ) > 0) {
                // call excel export
                $this->_createExcelByArray ( $data );
            } else {
                die ( "Sorry!! array not build." );
            }
        } else {
            die ( "Sorry!! json_decode not working on this server." );
        }
    }

    /**
     * Take an array and create
     * Excel file
     *
     * @param array $dataArray          
     */
    private function _createExcelByArray($dataArray) {
        // set excel file name
        $this->filename = 'DEMO-Excel' . '-' . date ( 'd-m-Y-H-s' );
        // get array field by first element of array
        foreach ( $dataArray [0] as $k => $v ) {
            $field [] = $k;
        }
        // get total no of field in array
        $totalFields = count ( $field );
        $i = $j = 0;
        // get array values
        foreach ( $dataArray as $v ) {
            for($j; $j < $totalFields; $j ++) {
                $value [$i] [] = $v [$field [$j]];
            }
            $i ++;
            $j = 0;
        }
        $this->initExcel ( $field, $value );
    }

    /**
     * Creating an Excel file with array data
     *
     * @param array $titles         
     * @param array $array          
     */
    public function initExcel($titles, $array) {
        $data = NULL;
        if (! is_array ( $array )) {
            die ( 'The data supplied is not a valid array' );
        } else {
            $headers = $this->titles ( $titles );
            if (is_array ( $array )) {
                foreach ( $array as $row ) {
                    $line = '';
                    foreach ( $row as $value ) {
                        if (! isset ( $value ) or $value == '') {
                            $value = "\t";
                        } else {
                            $value = str_replace ( '"', '""', $value );
                            $value = '"' . $value . '"' . "\t";
                        }
                        $line .= $value;
                    }
                    $data .= iconv ( "UTF-8", "GB18030//IGNORE", trim ( $line ) ) . "\n";
                }
                $data = str_replace ( "\r", "", $data );
                $this->generate ( $headers, $data );
            }
        }
    }

    /**
     * Create excel header and
     * write data into file
     *
     * @param string $headers           
     * @param string $data          
     */
    private function generate($headers, $data) {
        $this->set_headers ();
        echo "$headers\n$data";
    }

    /**
     * Set Excel file field header
     *
     * @param array $titles         
     * @return string
     */
    public function titles($titles) {
        if (is_array ( $titles )) {
            $headers = array ();
            if (is_null ( $this->custom_titles )) {
                if (is_array ( $titles )) {
                    foreach ( $titles as $title ) {
                        $headers [] = iconv ( "UTF-8", "GB18030//IGNORE", $title );
                    }
                } else {
                    foreach ( $titles as $title ) {
                        $headers [] = iconv ( "UTF-8", "GB18030//IGNORE", $title->name );
                    }
                }
            } else {
                $keys = array ();
                foreach ( $titles as $title ) {
                    $keys [] = iconv ( "UTF-8", "GB18030//IGNORE", $title->name );
                }
                foreach ( $keys as $key ) {
                    $headers [] = iconv ( "UTF-8", "GB18030//IGNORE", $this->custom_titles [array_search ( $key, $keys )] );
                }
            }
            return implode ( "\t", $headers );
        }
    }

    /**
     * Set Response Header
     */
    private function set_headers() {
        $ua = $_SERVER ["HTTP_USER_AGENT"];
        $filename = $this->filename . ".xls";
        $encoded_filename = urlencode ( $filename );
        $encoded_filename = str_replace ( "+", "%20", $encoded_filename );
        header ( "Pragma: public" );
        header ( "Expires: 0" );
        header ( "Cache-Control: must-revalidate, post-check=0, pre-check=0" );
        header ( "Content-Type: application/vnd.ms-excel; charset=UTF-8" );
        header ( "Content-Type: application/force-download" );
        header ( "Content-Type: application/octet-stream" );
        header ( "Content-Type: application/download" );
        if (preg_match ( "/MSIE/", $ua )) {
            header ( 'Content-Disposition: attachment; filename="' . $encoded_filename . '"' );
        } else if (preg_match ( "/Firefox/", $ua )) {
            header ( 'Content-Disposition: attachment; filename*="utf8\'\'' . $filename . '"' );
        } else {
            header ( 'Content-Disposition: attachment; filename="' . $filename . '"' );
        }
        header ( "Content-Transfer-Encoding: binary" );
    }
}
