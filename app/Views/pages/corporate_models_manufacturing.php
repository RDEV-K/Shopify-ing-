<div class="no expad manuf_content">
    
</div>

<script src="<?=base_url() ?>/public/js/convertColToData.js"></script>
<script src="<?=base_url() ?>/public/js/convertToWord.js?v=<?= date('d s'); ?>"></script>

<?php
    $user_id = null;
    if(session()->has('user_id')) : 
        $user_id = session()->get('user_id');
    else : ?>
    <script>
        $('.manuf_content').html("<div class=display-3>Session timeout, Please login again</div>")
    </script>
    <?php endif ?>
<script>
    function word() {
        convertTableToData().then(colData => {
            generate(colData);
        });
    }
</script>
<script>
    var user = '<?= $user_id ?>';
    if(user) {
        var url_manf = "<?= url_to('models_manufacturing_data', $models['models_id'], $user_id) ?>";
        $.get(url_manf, "data",
            function (data, textStatus, jqXHR) {
                $('.manuf_content').html(data);
            },
            "html"
        );
    }
</script>