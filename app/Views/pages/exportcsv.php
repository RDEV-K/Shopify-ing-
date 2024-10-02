
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="<?=base_url() ?>/public/js/convertToCSV.js"> </script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <script src="https://unpkg.com/docx@7.1.0/build/index.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.js"></script>
</head>
<body class="pt-5 container-fluid">
<div class="container">

<div class="download-wrapper">
    <button class="btn btn-dark btn-sm" onclick="word();">Export .doc</button>
    <button <?php if(!empty($data)) : ?> onclick="csv()" <?php endif ?> class="btn btn-secondary btn-sm"<?php if(empty($data)) : ?>disabled<?php endif ?>>Export .csv</button>
    <button class="btn btn-danger btn-sm" onclick="back()">Back</button>
</div>

<?php if(!empty($data)) : 
    $class = null;
    if(!empty($headers)) {
        $col = count($headers);
        $class = 100/(int)$col;
    }
?>

    <div class="mt-3 mb-5 card">
        <strong><div class="card-header"><?= $title ?? "not_available" ?></div></strong>
        <div class="card-body">
            <?php if(!empty($headerInfo)) :  ?>
                <div class="col-md-4 flex-row-reverse">
                <table class="table table-striped border-top mb-5">
            <?php foreach($headerInfo[1] as $key_info => $headLabel) :?>
                    <tr><th><?= $headLabel?></th><td><?= $headerInfo[0][$key_info] ?></td></tr>
            <?php endforeach;?>
                </table></div>
            <?php endif ?>
            <!-- Header -->
        <?php $label=[]; if(!empty($headers)) : ?>
            <div class="row mb-3">
            <?php foreach($headers as $k_h => $header ) : array_push($label,$k_h);?>
                <div style="width: <?=$class?>%;" ><strong><?= $header;?></strong></div>
            <?php endforeach;?>
            </div>
            
            <div class="form-group row mb-3">
            <?php foreach($data as $key => $value ) :?>
                <?php foreach($headers as $k_h => $header ) :
                ?>
                    <label class="col-form-label" style="width: <?=$class?>%;"><?= $value[$k_h] ?? "-" ?></label>
                <?php endforeach;?>
            <?php endforeach;?>
            </div>
        <?php endif;?>
        </div>
    </div>
</div>
<?php else : ?>
    <table class="table table-bordered text-sm-center">
        <tbody>
            <tr><th class="text-muted display-1">Data not available</th></tr>
        </tbody>
    </table>
<?php endif ?>
<script>
    var url = '<?= base_url() ?>/<?=$url?>';
    if('<?=$id?>') {
        url += '/<?=$id?>'
    }
    $(document).ready(function() {
    });
    function isEmpty(obj) {
        return Object.keys(obj).length === 0;
    }
    function extractData() {
        return new Promise((res,rej) => {
            $.ajax({
                type: "post",
                url: url,
                data: {},
                dataType: "JSON",
                success: function (response) {
                    if(!isEmpty(response)){
                        res(response);
                    }
                }
            });
        })
    }
    function csv() {
        extractData().then(data => download(data));
    }
    
    function word() {
        extractData().then(data => generate(data));
    }

    function back() {
        return window.history.back();
    }
</script>
</body>
</html>