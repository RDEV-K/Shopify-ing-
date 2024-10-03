<div class="no expad form_content">

</div>

<script src="<?=base_url() ?>/public/js/convertColToData.js?4"></script>
<script src="<?=base_url() ?>/public/js/convertToWord.js?v=<?= date('d s'); ?>"></script>

<script>
    function word() {
        convertTableToData().then(colData => {
            generate(colData);
        });
    }
</script>
<script>

    var url_fomu = "<?= url_to('models_formulas_data', $models_id) ?>";
    $.get(url_fomu, "data",
        function (data, textStatus, jqXHR) {
            $('.form_content').html(data);
        },
        "html"
    );
</script>