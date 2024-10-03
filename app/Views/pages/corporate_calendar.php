<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>

<head>
    <!-- Essential JS 2 Scheduler's dependent material theme -->
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-base/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-buttons/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-calendars/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-dropdowns/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-inputs/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-splitbuttons/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-lists/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-popups/styles/material.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-navigations/styles/material.css" rel="stylesheet" type="text/css"/>
    <!-- Essential JS 2 Scheduler's material theme -->
    <link href="https://cdn.syncfusion.com/ej2/26.1.35/ej2-schedule/styles/material.css" rel="stylesheet" type="text/css"/>

    <!-- Essential JS 2 Scheduler's dependent script -->
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-base/dist/global/ej2-base.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-inputs/dist/global/ej2-inputs.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-calendars/dist/global/ej2-calendars.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-file-utils/dist/global/ej2-file-utils.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-buttons/dist/global/ej2-buttons.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-lists/dist/global/ej2-lists.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-data/dist/global/ej2-data.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-navigations/dist/global/ej2-navigations.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-popups/dist/global/ej2-popups.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-dropdowns/dist/global/ej2-dropdowns.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-splitbuttons/dist/global/ej2-splitbuttons.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-compression/dist/global/ej2-compression.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-excel-export/dist/global/ej2-excel-export.min.js" type="text/javascript"></script>
    
    <!-- Essential JS 2 Scheduler's global script -->
    <script src="https://cdn.syncfusion.com/ej2/26.1.35/ej2-schedule/dist/global/ej2-schedule.min.js" type="text/javascript"></script>

</head>

<div class="no px-3 mt-4 expad">

    <div id="container">
        <div class="content-wrapper">
            <div id="Schedule"></div>
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

    var scheduleObj = new ej.schedule.Schedule();
    scheduleObj.appendTo('#Schedule');
</script>


