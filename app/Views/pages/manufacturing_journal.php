<!DOCTYPE html>
<html lang="en">

<head>
    <title>Essential JS 2 Rich Text Editor</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Typescript UI Controls">
    <meta name="author" content="Syncfusion">
    <link href="index.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-base/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-richtexteditor/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-inputs/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-lists/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-navigations/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-popups/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-buttons/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/25.1.35/ej2-splitbuttons/styles/material.css" rel="stylesheet">


    <script src="https://cdn.syncfusion.com/ej2/25.1.35/dist/ej2.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/syncfusion-helper.js" type="text/javascript"></script>

    <!-- Essential JS 2 Rich Text Editor's global script -->
    <script src="http://cdn.syncfusion.com/ej2/ej2-richtexteditor/dist/global/ej2-richtexteditor.min.js" type="text/javascript"></script>


    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'G-J35T3JYF4D');
    </script>
</head>

<body>
    <div class="expad no mt-3">
        <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">
            <div id="container">
                
                <div id="defaultRTE">
                    <?php $j_id=0; if(!empty($journal_data)): $j_id=$journal_data->journal_id; ?>
                        <?= htmlspecialchars_decode($journal_data->journal_content); ?>
                    <?php endif; ?>
                </div>
                
            </div>
            <style>
                .e-rte-quick-popup .e-rte-quick-toolbar .e-rotate-left::before {
                    content: "\e76e";
                }

                .e-rte-quick-popup .e-rte-quick-toolbar .e-rotate-right::before {
                    content: "\e726";
                }
            </style>

        </main>
    </div>
        
    <script>
        
        var journal_id = parseInt(<?= $j_id; ?>);
        
        var saveTextUrl = `<?=url_to('save_journal') ?>`;
        var saveUrl_var = `<?= base_url() ?>/manufacturing/journal/image`;
        var path_var =`<?= base_url() ?>/upload/`;
    </script>
    <script src="<?=base_url('public/js/handlingTextEditor.js?timestamp='.time()) ?>"></script>

</body>

</html>