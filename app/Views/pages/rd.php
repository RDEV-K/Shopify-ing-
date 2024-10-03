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
                <!-- Compliance -->
                <!--<a id="compliance-policies" href="<?= base_url() ?>/policies"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '4' ? $color : '' ?>">Policies</button></a>-->
                <!--<a id="compliance-testing" href="<?= base_url() ?>/testing"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '5' ? $color : '' ?>">Testing</button></a>-->
                <a id="compliance-pif" href="<?= base_url() ?>/rd/cpn"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '1' ? $color : '' ?>">PIF</button></a>
                <a id="compliance-ingredient-batch" href="<?= base_url() ?>/manufacturing/ingredientbatches"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '2' ? $color : '' ?>">Ingredient Batches</button></a>
                <a id="compliance-production-batch" href="<?= base_url() ?>/manufacturing/batchcertificates"><button class="btn btn-sm btn-klean mb-2 <?= $sub == '3' ? $color : '' ?>">Production Batches</button></a>
            </div>
        </div>
    </main>
</div>
<section class="section">