<div class="no expad packg_content"></div>

<script src="<?=base_url() ?>/public/js/convertColToData.js"></script>
<script src="<?=base_url() ?>/public/js/convertToWord.js?v=<?= date('d s'); ?>"></script>


<script>
    function word() {
        convertTableToData().then(colData => {
            generate(colData);
        });
    }
</script>
<script>
    var url_pkg = "<?= url_to('models_packaging_data', $models['models_id']) ?>";
    $.get(url_pkg, "data",
        function (data, textStatus, jqXHR) {
            $('.packg_content').html(data);
        },
        "html"
    );
</script>