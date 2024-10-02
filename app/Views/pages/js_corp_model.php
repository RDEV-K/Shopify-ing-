
<?php $pp = null;$tr=null;$ir=null;$status=null;
    $export_var = [];
    if($marketing) { 
        $pp = $marketing['models_sales_pp'];
        $tr = $marketing['models_sales_tr'];
        $ir = $marketing['models_li'];
        $status = 1;
    }
?>
<script>
    var export_var = [];
    var models_la = 0;

function getCalc(unit_q_F,no_u_F) {
    var rrp_sum = 0;
    var str_sum = 0;
    var pro_count = 0;
    var rrp = [];
    var formu_id = [];
    var models_sales_tr = '<?=$tr?>';
    var models_oht = '<?=$models_oht ?>';
    var models_li = '<?=$ir ?>';
    if(!models_li) models_li = 0;
    if(!models_sales_tr) models_sales_tr = 0;
    var models_puc = 0;
    
    var ir = 0;
    var lr = 0;
    if(models_li) {
        models_la = parseFloat(models_la);
        models_li = parseFloat(models_li);
        ir = models_la * (models_li/100);
        lr = ir + models_la;
    }
    var oht = '<?=$models_oht ?>';
    if(!oht) oht = 0;
    var mkt = '<?=$models_mkt?>';
    if(!mkt) mkt = 0;
    var igt = '<?=$models_igt?>';
    if(!igt) igt = 0;
    var pkt = '<?=$models_pkt?>';
    if(!pkt) pkt = 0;
    var mft = '<?=$models_mft?>';
    if(!mft) mft = 0;
    var nou = '<?=$models_nou?>';
    if(!nou) nou = 0;
    var ouc = 0;
    var models_pbe = 0;

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
                        var models_sales_pp = '<?= $pp?>';
                        if(!models_sales_pp) models_sales_pp = 0;
                        var models_rrp = '<?= $rrp?>';
                        models_rrp = parseFloat(models_rrp);
                        
                        rrp_sum = rrp_sum + models_rrp;
                        var unit_no_u = unit_q_F / no_u_F;
                        var models_str = models_rrp * unit_no_u;
                        str_sum = str_sum + models_str;
                        ouc = (oht+mkt+ir)/nou;
                        models_pbe = ouc + models_puc;

                    <?php else : ?>
                        if(pro_count < 1) pro_count = 0;
                    <?php endif;
                endforeach;
            endif;
        endforeach; endif ?>

    var models_mst = str_sum / models_sales_tr;
    var models_profit = 0;

    if(models_sales_tr && models_sales_tr > 0) mkt = models_mst;
    
    if(!mkt) mkt = 0;

    var m_spend = parseFloat(oht) + parseFloat(mkt) + parseFloat(igt) + parseFloat(pkt) + parseFloat(mft);
    models_profit = str_sum-m_spend-ir;
    models_la = m_spend;
    
    recalc(unit_q_F,no_u_F);
}
function recalc(unit_q_F,no_u_F) {
    /* Recalculate */
    var rrp_sum = 0;
    var str_sum = 0;
    var pro_count = 0;
    var rrp = [];
    var formu_id = [];
    
    var models_sales_tr = '<?=$tr?>';
    var models_oht = '<?=$models_oht ?>';
    var models_li = '<?=$ir ?>';
    
    if(!models_li) models_li = 0;
    if(!models_sales_tr) models_sales_tr = 0;
    var models_puc = 0;
    
        // console.log(models_li,"models_Li")
    var ir = 0;
    var lr = 0;
    console.log(models_la,"models_Li");
    if(models_li) {
        models_la = parseFloat(models_la);
        models_li = parseFloat(models_li);
        ir = models_la * (models_li/100);
        lr = ir + models_la;
    }
    console.log(ir)
    
    var oht = '<?=$models_oht ?>';
    if(!oht) oht = 0;
    var mkt = '<?=$models_mkt?>';
    if(!mkt) mkt = 0;
    var igt = '<?=$models_igt?>';
    if(!igt) igt = 0;
    var pkt = '<?=$models_pkt?>';
    if(!pkt) pkt = 0;
    var mft = '<?=$models_mft?>';
    if(!mft) mft = 0;
    var nou = '<?=$models_nou?>';
    
    if(!nou) nou = 0;
    var ouc = 0;
    var models_pbe = 0;
    
    <?php if($product_lists) : foreach($product_lists as $key => $prod ) : 
            $rrp = null;
            if($marketing) :
                $models_rrp = json_decode($marketing['models_rrp']);
                $formu_id = json_decode($marketing['formu_id']);
                foreach($formu_id as $f => $formu_) : 
                    if($prod->formula_id == $formu_) :
                        $rrp = $models_rrp[$f];?>

                        formu_id.push('<?= $prod->formula_id?>');
                        rrp.push('<?= $rrp?>');
                        pro_count = pro_count + 1;
                        var models_sales_pp = '<?= $pp?>';
                        if(!models_sales_pp) models_sales_pp = 0;
                        
                        var models_rrp = '<?= $rrp?>';
                        models_rrp = parseFloat(models_rrp);
                        
                        rrp_sum = rrp_sum + models_rrp;
                        var unit_no_u = unit_q_F / no_u_F;
                        var models_str = models_rrp * unit_no_u;
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

    var models_mst = str_sum / models_sales_tr;
    var models_profit = 0;

    if(models_sales_tr && models_sales_tr > 0) mkt = models_mst;
    
    if(!mkt) mkt = 0;

    var m_spend = parseFloat(oht) + parseFloat(mkt) + parseFloat(igt) + parseFloat(pkt) + parseFloat(mft);
    models_profit = str_sum-m_spend-ir;
    console.log(oht ,mkt ,igt ,pkt ,mft)

    var val = {
        spend: m_spend,
        l_interest: ir,
        t_return: str_sum,
        g_profit: models_profit,
        p_percent: '<?=$pp?>'
    }

    export_var.push(val);
    console.log(export_var);
    var name = 'akeem';
    var vale = 'Programmingd hgyy';
    var expires;
    // document.cookie = escape(name) + '=' + escape(export_var) + ";path=/";

}

Number.prototype.format_number = function(n,x) {
    var re = `\\d(?=(\\d{${x||3}})+${(n > 0 ? '\\.': '$')})`;
    return this.toFixed(Math.max(0,~~n)).replace(new RegExp(re,'g'), '$&,');
}
    var unit_q_F = '<?=$unit_q_F ?>';
    var no_u_F = '<?=$no_u_F ?>';
    if('<?=$status?>') {
        getCalc(unit_q_F,no_u_F);
    }
</script>
