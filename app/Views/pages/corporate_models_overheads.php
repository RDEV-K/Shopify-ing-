<div class="no expad over_content">

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
<?php
    $model_id = $models['models_id'];
?>
<script>

    var url_ovh = "<?= url_to('model_overview_data', $model_id) ?>";
    $.get(url_ovh, "data",
        function (data, textStatus, jqXHR) {
            $('.over_content').html(data);
        },
        "html"
    );
</script>