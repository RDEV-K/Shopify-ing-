<div class="no expad">
    <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3 mt-1">
        <div class="row mb-3">
            <strong>Business Plan - <?php echo $models['models_name']; ?> </strong>
        </div>

        <div class="row">
            <div class="col-12">
                <a href="<?= base_url() ?>/corporate_models_overheads/<?php echo $models['models_id']; ?>"><button class="btn btn-sm btn-klean-active mb-2">Overheads</button></a>
                <a href="<?= base_url() ?>/corporate_models_formulas/<?php echo $models['models_id']; ?>"><button class="btn btn-sm btn-klean-active mb-2">Formulas</button></a>
                <a href="<?= base_url() ?>/corporate_models_ingredients/<?php echo $models['models_id']; ?>"><button class="btn btn-sm btn-klean-active mb-2">Ingredients</button></a>
                <a href="<?= base_url() ?>/corporate_models_packaging/<?php echo $models['models_id']; ?>"><button class="btn btn-sm btn-klean-active mb-2">Packaging</button></a>
                <a href="<?= base_url() ?>/corporate_models_manufacturing/<?php echo $models['models_id']; ?>"><button class="btn btn-sm btn-klean-active mb-2">Manufacturing</button></a>
                <a href="<?= base_url() ?>/corporate_models_marketing/<?php echo $models['models_id']; ?>"><button class="btn btn-sm btn-klean-active mb-2">Marketing & Finance</button></a>
            </div>
        </div>
    </main>
