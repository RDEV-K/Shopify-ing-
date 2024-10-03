<div class="no expad markt_content">

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
    var url_mkt = "<?= url_to('models_marketing_data', $models_id) ?>";
    $.get(url_mkt, "data",
        function (data, textStatus, jqXHR) {
            $('.markt_content').html(data);
        },
        "html"
    );
</script>