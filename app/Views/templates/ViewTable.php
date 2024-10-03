<?=$ejsyncfusion ?>
<?=$view_table ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Table</title>
</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div id="viewTables"></div>
        </div>
    </div>
    <script>
        if(typeof window.convert_to_grid === 'function') {
            LoadGridTable(convert_to_grid(),'viewTables',columns);
        }else {
            $.get(url,
                function (data, textStatus, jqXHR) {
                    LoadGridTable(JSON.parse(data),'viewTables',columns);
                },
            );
        }
    </script>
</body>
</html>
