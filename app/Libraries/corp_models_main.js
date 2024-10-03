
<?php $pp = null;$tr=null;$ir=null;$status=null;
    if($marketing) : 
        $pp = $marketing['models_sales_pp'];
        $tr = $marketing['models_sales_tr'];
        $ir = $marketing['models_li'];
        $status = 1;
?>
<script>
function getCalc(unit_q_F,no_u_F) {
    let rrp_sum = 0;
    let str_sum = 0;
    let pro_count = 0;
    let rrp = [];
    let formu_id = [];
    let models_sales_tr = '<?=$tr?>';
    let models_oht = '<?=$models_oht ?>';
    let models_li = '<?=$ir ?>';
    let models_la = 0;
    
    if(!models_li) models_li = 0;
    if(!models_sales_tr) models_sales_tr = 0;
    let models_puc = 0;
    
    let ir = 0;
    let lr = 0;
    if(models_li) {
        models_la = parseFloat(models_la);
        models_li = parseFloat(models_li);
        ir = models_la * (models_li/100);
        lr = ir + models_la;
    }
    let oht = '<?=$models_oht ?>';
    if(!oht) oht = 0;
    let mkt = '<?=$models_mkt?>';
    if(!mkt) mkt = 0;
    let igt = '<?=$models_igt?>';
    if(!igt) igt = 0;
    let pkt = '<?=$models_pkt?>';
    if(!pkt) pkt = 0;
    let mft = '<?=$models_mft?>';
    if(!mft) mft = 0;
    let nou = '<?=$models_nou?>';
    if(!nou) nou = 0;
    let ouc = 0;
    let models_pbe = 0;

    <?php if($product_lists) : foreach($product_lists as $key => $prod ) : 
            $rrp = null;
            if($marketing) :
                $models_rrp = json_decode($marketing['models_rrp']);
                $formu_id = json_decode($marketing['formu_id']);
                foreach($formu_id as $f => $formu_) : 
                    if($prod->formula_id == $formu_) :
                        $rrp = $models_rrp[$f];?>
        // if($(v).val()) {

                        formu_id.push('<?= $prod->formula_id?>');
                        rrp.push('<?= $rrp?>');
                        
                        pro_count = pro_count + 1;
                        let models_sales_pp = '<?= $pp?>';
                        if(!models_sales_pp) models_sales_pp = 0;
                        let models_rrp = '<?= $rrp?>';
                        models_rrp = parseFloat(models_rrp);
                        
                        rrp_sum = rrp_sum + models_rrp;
                        let unit_no_u = unit_q_F / no_u_F;
                        let models_str = models_rrp * unit_no_u;
                        str_sum = str_sum + models_str;
                        ouc = (oht+mkt+ir)/nou;
                        models_pbe = ouc + models_puc;

                    <?php else : ?>
                        if(pro_count < 1) pro_count = 0;
                    <?php endif;
                endforeach;
            endif
        ?>
    <?php endforeach; endif ?>

    let models_mst = str_sum / models_sales_tr;
    let models_profit = 0;

    if(models_sales_tr && models_sales_tr > 0) mkt = models_mst;
    
    if(!mkt) mkt = 0;

    let m_spend = oht + mkt + igt + pkt + mft;
    models_profit = str_sum-m_spend-ir;
    let models_la = m_spend;
    
    recalc(unit_q_F,no_u_F);
}
function recalc(unit_q_F,no_u_F) {
    /* Recalculate */
    let rrp_sum = 0;
    let str_sum = 0;
    let pro_count = 0;
    let rrp = [];
    let formu_id = [];
    
    let models_sales_tr = '<?=$tr?>';
    let models_oht = '<?=$models_oht ?>';
    let models_li = '<?=$ir ?>';
    let models_la = 0;
    
    if(!models_li) models_li = 0;
    if(!models_sales_tr) models_sales_tr = 0;
    let models_puc = 0;
    
    let ir = 0;
    let lr = 0;
    if(models_li) {
        models_la = parseFloat(models_la);
        models_li = parseFloat(models_li);
        ir = models_la * (models_li/100);
        lr = ir + models_la;
    }
    console.log(ir)
    
    let oht = '<?=$models_oht ?>';
    if(!oht) oht = 0;
    let mkt = '<?=$models_mkt?>';
    if(!mkt) mkt = 0;
    let igt = '<?=$models_igt?>';
    if(!igt) igt = 0;
    let pkt = '<?=$models_pkt?>';
    if(!pkt) pkt = 0;
    let mft = '<?=$models_mft?>';
    if(!mft) mft = 0;
    let nou = '<?=$models_nou?>';
    
    if(!nou) nou = 0;
    let ouc = 0;
    let models_pbe = 0;
    $('.models_rrp').each((i, v) => {
        if($(v).val()) {
            formu_id.push($(v).data('models_rrp'));
            rrp.push($(v).val());
            pro_count = pro_count + 1;
            let models_sales_pp = $('#models_sales_pp').val();
            if(!models_sales_pp) models_sales_pp = 0;
            // console.log(models_pbe + (models_pbe * parseFloat(models_sales_pp)))
            let models_rrp = $(v).val();
            models_rrp = parseFloat(models_rrp);
            rrp_sum = rrp_sum + models_rrp;
            let unit_no_u = unit_q_F / no_u_F;
            let models_str = models_rrp * unit_no_u;
            models_puc = $(v).parent().siblings('.models_puc').data('models_puc');
            models_puc = parseFloat(models_puc);
            str_sum = str_sum + models_str;
            ouc = (oht+mkt+ir)/nou;
            models_pbe = ouc + models_puc;
            $(v).parent().siblings('.models_pbe').html(`£${(models_pbe).format_number(2)}`);
            $(v).parent().siblings('.models_str').html(`£${models_str.format_number(2)}`);
            $(v).parent().siblings('.models_ppa').html(`£${((models_str - (models_pbe * unit_no_u))).format_number(2)}`);
            $(v).parent().siblings('.models_pip').html(`£${((models_pbe * (models_sales_pp/100)) + models_pbe).format_number(2)}`);
        }else {
            $(v).parent().siblings('.models_str').html(`£${(0).format_number(2)}`);
            $(v).parent().siblings('.models_ppa').html(`£${(0).format_number(2)}`);
            $(v).parent().siblings('.models_pip').html(`£${(0).format_number(2)}`);
            if(pro_count < 1) pro_count = 0;
        }
    });
    
    $("[name='formu_id']").val(JSON.stringify(formu_id));
    $("[name='models_rrp']").val(JSON.stringify(rrp));
    let models_mst = str_sum / models_sales_tr;
    let models_profit = 0;

    if(models_sales_tr && models_sales_tr > 0) {models_ir
        $('#models_mst').html(`£${(models_mst).format_number(2)}`);
        $('#models_mkt').html(`£${(models_mst).format_number(2)}`);
        document.querySelector('#models_mkt').dataset.models_mkt = models_mst;
        $('#cf_qas').html(`£${(models_mst).format_number(2)}`);
        $('#cf_mas').html(`£${(models_mst/3).format_number(2)}`);
        $('#cf_das').html(`£${(models_mst/28).format_number(2)}`);
    }else {
        $('#models_mst').html(`£${(0).format_number(2)}`);
        $('#cf_qas').html(`£${(0).format_number(2)}`);
        $('#cf_mas').html(`£${(0).format_number(2)}`);
        $('#cf_das').html(`£${(0).format_number(2)}`);
    }

    mkt = $('#models_mkt').data('models_mkt');
    if(!mkt) mkt = 0;

    let m_spend = oht + mkt + igt + pkt + mft;

    $('#models_ouc').html(`£${(ouc).format_number(2)}`);
    $('#models_mrt').html(`£${(str_sum).format_number(2)}`);
    $('#models_return').html(`£${(str_sum).format_number(2)}`);
    models_profit = str_sum-m_spend-ir;
    $('#models_profit').html(`£${(models_profit).format_number(2)}`);
    $('#models_spend').html(`£${(m_spend).format_number(2)}`);
    
    $('#cf_qr').html(`£${(str_sum).format_number(2)}`);
    $('#cf_mr').html(`£${(str_sum/3).format_number(2)}`);
    $('#cf_dr').html(`£${(str_sum/84).format_number(2)}`);

    $('#cf_qp').html(`£${(models_profit).format_number(2)}`);
    $('#cf_mp').html(`£${(models_profit/3).format_number(2)}`);
    $('#cf_dp').html(`£${(models_profit/84).format_number(2)}`);

    $('#cf_qss').html(`£${(m_spend).format_number(2)}`);
    $('#cf_mss').html(`£${(m_spend/3).format_number(2)}`);
    $('#cf_dss').html(`£${(m_spend/84).format_number(2)}`);

    if(pro_count) $('#brEvUnNo').html(`${(m_spend / (rrp_sum/pro_count)).format_number(2)}`);
    if(!pro_count) $('#brEvUnNo').html(`£${(0).format_number(2)}`);
    
    // console.log(rrp_sum);
    // all_format_no();
}

// format all numbers 
function all_format_no() {
    $('#cashs').children().each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(`£${parseFloat($(v).html()).format_number(2)}`)
    });
    $('#product_list td').each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(`£${parseFloat($(v).html()).format_number(2)}`);
    });
    $('#costs td').each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(`£${parseFloat($(v).html()).format_number(2)}`);
    });
    $('#sales td').each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(`£${parseFloat($(v).html()).format_number(2)}`);
    });

    /* Without currency symbol */
    $('#cashs td').children().each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
    });
    $('#product_list td span').each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
    });
    $('#costs td span').each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
    });
    $('#sales td span').each((i,v) => {
        if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
    });
}
Number.prototype.format_number = function(n,x) {
    let re = `\\d(?=(\\d{${x||3}})+${(n > 0 ? '\\.': '$')})`;
    return this.toFixed(Math.max(0,~~n)).replace(new RegExp(re,'g'), '$&,');
}
$(document).ready(function() {
    let unit_q_F = '<?=$unit_q_F ?>';
    let no_u_F = '<?=$no_u_F ?>';
    $('#product_list input').each((i,v) => {
        $(v).attr('oninput', `getCalc(${unit_q_F},${no_u_F})`);
    });
    $('#models_sales_pp').attr('oninput', `getCalc(${unit_q_F},${no_u_F})`);
    $('#models_li').attr('oninput', `getCalc(${unit_q_F},${no_u_F})`);
    $('#models_sales_tr').attr('oninput', `getCalc(${unit_q_F},${no_u_F})`);
    
    let models_sales_pp = $('#models_sales_pp').val();
    all_format_no();
    if('<?=$status?>') {
        getCalc(unit_q_F,no_u_F);
    }
})