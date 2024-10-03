<script>
    
    function LoadGridTable(data,table_rendering,columns) {
        ej.base.registerLicense('ORg4AjUWIQA/Gnt2VVhkQlFadVdJXGFWfVJpTGpQdk5xdV9DaVZUTWY/P1ZhSXxRd0dhUH9ZcHRVQWBbVkw=');
        const { Grid, Page, Toolbar, PdfExport, Sort } = ej.grids;
        Grid.Inject( Toolbar, PdfExport,Page, Sort );
        
        let gridview = new Grid(
            {
                dataSource: data,
                columns,
                allowPaging: true,
                allowPdfExport:true,
                toolbar: ['PdfExport','Print'],
                allowSorting: true,
                allowMultiSorting: true,
            }
        );
        gridview.appendTo('#'+table_rendering);
        gridview.toolbarClick = function(args){
            // console.log(args['item']);

            if (args['item'].id === 'viewTables_pdfexport') {
                let exportProperties = {
                    fileName:"Business Plan.pdf"
                };
                gridview.showSpinner();
                gridview.pdfExport(exportProperties);
            }
        }
        
        gridview.pdfExportComplete = () => {
            gridview.hideSpinner();
        }
        gridview.pdfHeaderQueryCellInfo = function(args){
            args.cell.row.pdfGrid.repeatHeader = true;
        }
    }

</script>