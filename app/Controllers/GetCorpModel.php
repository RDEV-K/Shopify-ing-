<?php
namespace App\Controllers;

class GetCorpModel 
{
    private $data;
    private $status = null;
    private $pp = null;
    private $tr = null;
    private $ir = null;
    public $export_var = [];
    private $models_la = null;
    public function __construct($datas=array())
    {
        $this->data = $datas;
        extract($datas);
        if($marketing) {
            $this->status = 1;
            $this->pp = $marketing['models_sales_pp'];
            $this->tr = $marketing['models_sales_tr'];
            $this->ir = $marketing['models_li'];
        }
        
        if($this->status) {
            $this->getCalc($unit_q_F,$no_u_F);
        }
    }
        
    private function getCalc($unit_q_F,$no_u_F) {
        extract($this->data);
        
        $rrp_sum = 0;
        $str_sum = 0;
        $pro_count = 0;
        $rrps = [];
        $formu_ids = [];
        $models_sales_tr = $this->tr;
        $models_li = $this->ir;
        $models_oht = $models_oht;
        $models_la = 0;
        if(!$models_li) $models_li = 0;
        if(!$models_sales_tr) $models_sales_tr = 0;
        $models_puc = 0;

        $ir = 0;
        $lr = 0;
        if($models_li) {
            $ir = $models_la * ($models_li/100);
            $lr = $ir + $models_la;
        }
        $oht = $models_oht ;
        if(!$oht) $oht = 0;
        $mkt = $models_mkt;
        if(!$mkt) $mkt = 0;
        $igt = $models_igt;
        if(!$igt) $igt = 0;
        $pkt = $models_pkt;
        if(!$pkt) $pkt = 0;
        $mft = $models_mft;
        if(!$mft) $mft = 0;
        $nou = $tot_q_F;
        if(!$nou) $nou = 0;
        $ouc = 0;
        $models_pbe = 0;

        if(!empty($product_lists)) {
            foreach($product_lists as $key => $prod ) {
            
                $rrp = null;
                if($marketing) {
                    $models_rrp = json_decode($marketing['models_rrp']);
                    $formu_id = json_decode($marketing['formu_id']);
                    // dd($prod);
                    foreach($formu_id as $f => $formu_) {
                        if(property_exists($prod, 'formula_id') && $prod->formula_id == $formu_) {
                            $rrp = $models_rrp[$f];
                            

                            array_push($formu_ids, $prod->formula_id);
                            array_push($rrps,$rrp);
                            
                            $pro_count = $pro_count + 1;
                            $models_sales_pp =  $this->pp;
                            if(!$models_sales_pp) $models_sales_pp = 0;
                            $models_rrp =  $rrp;

                            $rrp_sum = $rrp_sum + $models_rrp;
                            $unit_no_u = $unit_q_F / $no_u_F;
                            $models_str = $models_rrp * $unit_no_u;
                            $str_sum = $str_sum + $models_str;
                            $ouc = ($oht+$mkt+$ir)/$nou;
                            $models_pbe = $ouc + $models_puc;

                        }else {
                            if($pro_count < 1) $pro_count = 0;
                        }
                    }
                }
            }
        } 

        $models_mst = 0;
        if($models_sales_tr == 0) {
            $models_mst = 0;
        }else{
            $models_mst = $str_sum / $models_sales_tr;
        }
        $models_profit = 0;

        if($models_sales_tr && $models_sales_tr > 0) $mkt = $models_mst;

        if(!$mkt) $mkt = 0;

        $m_spend = $oht + $mkt + $igt + $pkt + $mft;
        $models_profit = $str_sum-$m_spend-$ir;
        $this->models_la = $m_spend;

        $this->recalc($unit_q_F,$no_u_F,$models_mst);
    }
    private function recalc($unit_q_F,$no_u_F,$models_mst) {
        /* Recalculate */
        extract($this->data);
        
        $rrp_sum = 0;
        $str_sum = 0;
        $pro_count = 0;
        $rrps = [];
        $formu_ids = [];

        $models_sales_tr = $this->tr;
        $models_li = $this->ir;
        $models_oht = $models_oht ;
        $models_la = $this->models_la;
        if(!$models_li) $models_li = 0;
        if(!$models_sales_tr) $models_sales_tr = 0;
        $models_puc = 0;
        
        $ir = 0;
        $lr = 0;
        
        if($models_li) {
            $ir = $models_la * ($models_li/100);
            $lr = $ir + $models_la;
        }

        $oht = $models_oht ;
        if(!$oht) $oht = 0;
        $mkt = $models_mst;
        if(!$mkt) $mkt = 0;
        $igt = $models_igt;
        if(!$igt) $igt = 0;
        $pkt = $models_pkt;
        if(!$pkt) $pkt = 0;
        $mft = $models_mft;
        if(!$mft) $mft = 0;
        $nou = $tot_q_F;
        if(!$nou) $nou = 0;
        $ouc = 0;
        $models_pbe = 0;

        if($product_lists) {
            foreach($product_lists as $key => $prod ) {
            
                $rrp = null;
                if($marketing) {
                    $models_rrp = json_decode($marketing['models_rrp']);
                    $formu_id = json_decode($marketing['formu_id']);
                    foreach($formu_id as $f => $formu_) {
                        if(property_exists($prod, 'formula_id') && $prod->formula_id == $formu_) {
                            $rrp = $models_rrp[$f];
                            

                            array_push($formu_id, $prod->formula_id);
                            array_push($rrps,$rrp);
                            
                            $pro_count = $pro_count + 1;
                            $models_sales_pp =  $this->pp;
                            if(!$models_sales_pp) $models_sales_pp = 0;
                            $models_rrp =  $rrp;
                                                
                            

                            $rrp_sum = $rrp_sum + $models_rrp;
                            $unit_no_u = $unit_q_F / $no_u_F;
                            $models_str = $models_rrp * $unit_no_u;
                            $str_sum = $str_sum + $models_str;

                            $ouc = ($oht+$mkt+$ir)/$nou;
                            $models_pbe = $ouc + $models_puc;
                            

                        }else {
                            $ouc = ($oht+$mkt+$ir)/$nou;
                            if($pro_count < 1) $pro_count = 0;
                        }
                    }
                }
            }
        } 


        // $models_mst = $str_sum / $models_sales_tr;
        $models_profit = 0;

        // if($models_sales_tr && $models_sales_tr > 0) $mkt = $models_mst;


        $m_spend = $oht + $mkt + $igt + $pkt + $mft;
        $models_profit = $str_sum-$m_spend-$ir;
        // $models_la = $m_spend;
        $val = [
            'spend' => ($m_spend+$ir),
            'revenue' => $str_sum,
            'profit' => $models_profit,
            'margin' => $this->pp,
            'qty' => $batch_qty
        ];

        array_push($this->export_var,$val);
    }

}
