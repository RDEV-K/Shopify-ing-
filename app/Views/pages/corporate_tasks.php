<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>

<head>
    <!-- Essential JS 2 Kanban's dependent material theme -->
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-base/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-buttons/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-inputs/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-dropdowns/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-layouts/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-navigations/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-popups/styles/material.css" rel="stylesheet">
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-kanban/styles/material.css" rel="stylesheet">

    <!-- Essential JS 2 Kanban's dependent script -->
    <script src="http://cdn.syncfusion.com/ej2/ej2-base/dist/global/ej2-base.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-data/dist/global/ej2-data.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-data/dist/global/ej2-dropdown.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-inputs/dist/global/ej2-inputs.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-buttons/dist/global/ej2-buttons.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-layouts/dist/global/ej2-layouts.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-splitbuttons/dist/global/ej2-splitbuttons.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-lists/dist/global/ej2-lists.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-popups/dist/global/ej2-popups.min.js" type="text/javascript"></script>
    <script src="http://cdn.syncfusion.com/ej2/ej2-navigations/dist/global/ej2-navigations.min.js" type="text/javascript"></script>
    
    <!-- Essential JS 2 Kanban's global script -->
    <script src="http://cdn.syncfusion.com/ej2/ej2-kanban/dist/global/ej2-kanban.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/dist/ej2.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/syncfusion-helper.js" type ="text/javascript"></script>

</head>

<div class="no px-3 mt-4 expad">

    <div id="container">
        <div class="content-wrapper">
            <div id="Kanban"></div>
        </div>
    </div>

</div>

<script>
    var ele = document.getElementById('container');
    if(ele) {
    ele.style.visibility = "visible";
    }   
</script>

<script>

    // Registering Syncfusion license key
    ej.base.registerLicense('ORg4AjUWIQA/Gnt2U1hhQlJBfV5AQmBIYVp/TGpJfl96cVxMZVVBJAtUQF1hTX5Ud0NjXHxYcHNRQGJV');

    var data = new ej.data.DataManager({
        url: 'https://services.syncfusion.com/js/production/api/Kanban',
        adaptor: new ej.data.ODataAdaptor,
    });
    var kanbanObj = new ej.kanban.Kanban({
        dataSource: data,
        keyField: 'Status',
        columns: [
            { headerText: 'Backlog', keyField: 'Open' },
            { headerText: 'In Progress', keyField: 'InProgress' },
            { headerText: 'Testing', keyField: 'Testing' },
            { headerText: 'Done', keyField: 'Close' }
        ],
        cardSettings: {
            contentField: 'Summary',
            headerField: 'Id'
        },
        allowDragAndDrop: false,
        dialogOpen: dialogOpen
    });
    kanbanObj.appendTo('#Kanban');
    function dialogOpen(args) {
        args.cancel = true;
    }
</script>


