<style>
    .form-button {
        display: none !important;
    }
</style>
<div class="container-fluid mt-5">
    <button type="button" onclick="word()" class="btn btn-warning exportAll" style="margin-left: 10px;">Export (.doc)</button>
    <div class=" row content"></div>
</div>

<script>
    var model_id = '<?= $model_id ?>';
    var root_url = '<?= base_url() ?>';
    function getModels(url,callback) {
        $.get(url, "data",
            function (data, textStatus, jqXHR) {
                callback(jqXHR.responseText);
            },
            "html"
        );
    }
    function getMod(url) {
        return new Promise((res,rej) => {
            $.get(url, "data",
                function (data, textStatus, jqXHR) {
                    res(jqXHR.responseText);
                },
                "html"
            );
        });
    }
    function getAllModels(models_uri) {
        return new Promise((res,rej) => {
            var content = [];
            var contents = [];
            let count = 0;
            let counts = 0;
            $.each(models_uri, async(uri, params) => {
                let items = {}
                let item = {}
                let url_all = `${root_url}/${uri}/${model_id}`;
                if(params == 2) {
                    url_all += '/<?= $user_id ?>';
                }
                getModels(url_all, function(model) {
                    count += 1;
                    items[uri] = model;
                    content.push(items);
                    if(count === Object.keys(models_uri).length) {
                        res(content);
                    }
                });
            });
        });
    }
    function isEmpty(obj) {
        return Object.keys(obj).length === 0;
    }
    
    $(document).ready( async function() {
        var models_uri = {
            corporate_models_overheads_data: 1,
            corporate_models_formulas_data: 1,
            corporate_models_ingredients_data: 1,
            corporate_models_packaging_data: 1,
            corporate_models_manufacturing_data: 2,
            corporate_models_marketing_data: 1
        };
        
        getAllModels(models_uri).then(allModels => {
            let num_models = 0
            if(!isEmpty(allModels)){
                let chk = [];
                $.each( models_uri, (uri, model_params) => {
                    $.each(allModels, (model_index, model_data) => {
                        if(uri == Object.keys(model_data)[0]) {
                            $('.content').append(model_data[uri]);
                            $('.content').append("<br>");
                            $('.content').append("<br>");
                            $('.content').append("<hr>");
                        }
                    });
                    num_models += 1;
                    if(num_models == Object.keys(models_uri).length) {
                        $('.export_message').html('<b>Finished Exporting to MsWord</b>');
                        $('#toMsWordLabel').html('Export to MsWord [<b>Business Plan</b>] <b>Done!</b>');
                        $('.export_status').html('<i class="fa-solid text-success fa-check fa-3x "></i>');
                        $('.export_status').addClass('text-info');
                        setTimeout(() => {
                            $('.exportAll').triggerHandler("click");
                            window.location.replace(`${root_url}/corporate/models`);
                        }, 3000);
                    }
                });
            }
        });
    });
</script>

<script src="<?=base_url() ?>/public/js/convertColToData.js"></script>
<script src="<?=base_url() ?>/public/js/convertToWord.js?v=<?= date('d s'); ?>"></script>

<script>
    function word() {
        return new Promise((res,rej) => {
            convertTableToData().then(colData => {
                generate(colData);
                res("Done");
            });
        })
    }
</script>