<div class="no">
    <main role="main" class="col-md-12 ml-sm-auto col-lg-12 pt-3 px-3">
        <div
            class="d-flex justify-content-md-start justify-content-lg-end flex-wrap flex-md-nowrap align-items-center pb-2 mb-3">
            <?php
            $sub = '';
            if (session()->has('sub')) {
                $sub = session()->get('sub');
                $color = "btn-klean-active";
            }
            ?>
            <div class="mb-2 mb-md-0">
                <a href="<?= base_url() ?>/manufacturing/ingredients"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '1' ? $color : '' ?>">Ingredients</button></a>
                <a href="<?= base_url() ?>/rd/formula"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '2' ? $color : '' ?>">Formulas</button></a>
                <?php if (!$restrict): ?>
                    <a href="<?= base_url() ?>/manufacturing/production"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '3' ? $color : '' ?>">Production</button></a>
                    <a href="<?= base_url() ?>/manufacturing/journal"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '4' ? $color : '' ?>">Journal</button></a>
                <?php endif ?>
            </div>
            </p>
    </main>
</div>
<section class="section">