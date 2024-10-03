<div class="no">
    <main role="main" class="col-md-12 ml-sm-auto col-lg-12 pt-3 px-3">
        <div class="d-flex justify-content-md-start justify-content-lg-end flex-wrap flex-md-nowrap align-items-center">
            <?php 
                $sub = '';
                if(session()->has('sub')) {
                    $sub = session()->get('sub');
                    $color = "btn-klean-active";
                }
            ?>
            <div class="mb-2 mb-md-0">
                <!--<a href="<?= base_url() ?>/tasks"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '2' ? $color : '' ?>">Tasks</button></a>-->
                <!--<a href="<?= base_url() ?>/calendar"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '3' ? $color : '' ?>">Calendar</button></a>-->
                <a href="<?= base_url() ?>/corporate/models"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '1' ? $color : '' ?>">Business Planning</button></a>
            </div>
        </div>
    </main>
</div>
<section class="section">


