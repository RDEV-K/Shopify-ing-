<div class="no expad ingre_content">

</div>

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
    var url_ings = "<?= url_to('models_ingredients_data', $models['models_id']) ?>";
    $.get(url_ings, "data",
        function (data, textStatus, jqXHR) {
            $('.ingre_content').html(data);
        },
        "html"
    );
</script>