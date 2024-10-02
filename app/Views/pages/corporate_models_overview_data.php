<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3"> 
    <!--<pre> <?php //print_r($overheadmodels); die; ?></pre>-->
    <form method="post" id="add_entry" name="add_entry" action="<?= base_url() ?>/corporate_models_overheads_add">
        <div class="row mt-3">
            <div class="hid"></div>

                <div class="col-md-3 mb-3">
                    <div class="card">
                        <strong><div class="card-header">Yearly Non-Resource Costs</div></strong>
                        <div class="card-body one-section">
                            <div class="row table-data">
                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Banking</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_banking" name="models_overheads_banking" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Accounting</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_tech" name="models_overheads_tech" step="any" required>
                                    </div>
                                </div>
                            
                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Insurance</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_insurance" name="models_overheads_insurance" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Website & Hosting</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_domain" name="models_overheads_domain" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Telephone & Mail Services</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_phone" name="models_overheads_phone" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Software Subscriptions</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_software" name="models_overheads_software" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Company Formation Costs</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_filing" name="models_overheads_filing" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Property & Utilites</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_hosting" name="models_overheads_hosting" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Legal Fees</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_gdpr" name="models_overheads_gdpr" step="any" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-sm-6 col-form-label">Social Media</label>
                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="models_overheads_mail" name="models_overheads_mail" step="any" required>
                                    </div>
                                </div>

                                <input type="hidden" name="models_id" id="models_id" value="<?php echo $models['models_id']; ?>">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 mb-3">
                    <div class="card">
                        <strong><div class="card-header">Yearly Resource Costs</div></strong>
                        <div class="card-body table-data">

                            <div class="hide row mb-3">
                                <div class="col-3"><strong>Staff</strong></div>
                                <div class="col-3"><strong>Hourly Rate</strong></div>
                                <div class="col-3"><strong>Weekly Hours</strong></div>
                                <div class="col-3"><strong>Yearly Cost</strong></div>
                            </div>

                            <style>
                                @media screen and (max-width: 600px) {
                                    div.hide {
                                        display: none;
                                    }
                                }
                            </style>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Administration</label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_pub_rate" name="models_overheads_pub_rate" placeholder="Hourly Rate" step="any" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_pub_hours" name="models_overheads_pub_hours" placeholder="Weekly Hours" step="any" onInput="cal3()" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control disabled" id="models_overheads_pub_yearly" name="models_overheads_pub_yearly" placeholder="Yearly Cost" step="any" required readonly>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Manufacturing</label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_ops_rate" name="models_overheads_ops_rate" placeholder="Hourly Rate" step="any" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_ops_hours" name="models_overheads_ops_hours" placeholder="Weekly Hours" step="any" onInput="cal1()" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control disabled" id="models_overheads_ops_yearly" name="models_overheads_ops_yearly" placeholder="Yearly Cost" step="any" required readonly>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Sales</label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_coms_rate" name="models_overheads_coms_rate" placeholder="Hourly Rate" step="any" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_coms_hours" name="models_overheads_coms_hours" placeholder="Weekly Hours" step="any" onInput="cal2()" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control disabled" id="models_overheads_coms_yearly" name="models_overheads_coms_yearly" placeholder="Yearly Cost" step="any" required readonly>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Finances</label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_acc_rate" name="models_overheads_acc_rate" placeholder="Hourly Rate" step="any" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control mb-1" id="models_overheads_acc_hours" name="models_overheads_acc_hours" placeholder="Weekly Hours" step="any" onInput="cal4()" required>
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control disabled" id="models_overheads_acc_yearly" name="models_overheads_acc_yearly" placeholder="Yearly Cost" step="any" required readonly>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <div class="card">
                        <strong><div class="card-header">Overhead Costs</div></strong>
                        <div class="card-body">
                            <table id="example1" class="table display text-center">
                                <thead class="table-data">
                                    <tr>
                                        <th>Yearly</th>
                                        <th>Quartely</th>
                                        <th>Monthly</th>
                                        <th>Daily</th>
                                    </tr>
                                </thead>
                                <tbody class="table-data">
                                    <tr>
                                        <td><span id="yearlytotal"></td>
                                        <td><span id="quartelytotal"></td>
                                        <td><span id="monthlytotal"></td>
                                        <td><span id="dailytotal"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    
                        <!--<div class="card-footer">
                            <button type="button" class="btn btn-primary" onclick="overheasdcal()">Calculate</button>
                        </div>-->
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col justify-content-start align-items-center form-button">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" onclick="word()" class="btn btn-warning">Export</button>
                    <a href="https://ingrevo.com/business-planning-part-1-overheads/" target="_blank"><i id="help-icon" class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
                </div>
            </div>
        </form>
    </main>
    
<script>
    function cal1() {
        var a1 = document.getElementById("models_overheads_ops_rate").value;
        var b1 = document.getElementById("models_overheads_ops_hours").value;
        var c1 = Number(a1) * Number(b1) * 52;
        document.getElementById("models_overheads_ops_yearly").value = c1;
    }
    function cal2() {
        var a2 = document.getElementById("models_overheads_coms_rate").value;
        var b2 = document.getElementById("models_overheads_coms_hours").value;
        var c2 = Number(a2) * Number(b2) * 52;
        document.getElementById("models_overheads_coms_yearly").value = c2;
    }
    function cal3() {
        var a3 = document.getElementById("models_overheads_pub_rate").value;
        var b3 = document.getElementById("models_overheads_pub_hours").value;
        var c3 = Number(a3) * Number(b3) * 52;
        document.getElementById("models_overheads_pub_yearly").value = c3;
    }
    function cal4() {
        var a4 = document.getElementById("models_overheads_acc_rate").value;
        var b4 = document.getElementById("models_overheads_acc_hours").value;
        var c4 = Number(a4) * Number(b4) * 52;
        document.getElementById("models_overheads_acc_yearly").value = c4;
    }

    function overheasdcal() {

        // Non-Resource Expenses
        var a = document.getElementById("models_overheads_insurance").value;
        var b = document.getElementById("models_overheads_domain").value;
        var c = document.getElementById("models_overheads_hosting").value;
        var d = document.getElementById("models_overheads_gdpr").value;
        var e = document.getElementById("models_overheads_phone").value;
        var f = document.getElementById("models_overheads_mail").value;
        var g = document.getElementById("models_overheads_banking").value;
        var h = document.getElementById("models_overheads_tech").value;
        var i = document.getElementById("models_overheads_software").value;
        var j = document.getElementById("models_overheads_filing").value;

        var non_restotal = Number(a) + Number(b) + Number(c) + Number(d) + Number(e) + Number(f) + Number(g) + Number(h) + Number(i) + Number(j);

        // Resource Expenses
        var k = document.getElementById("models_overheads_ops_yearly").value;
        var l = document.getElementById("models_overheads_coms_yearly").value;
        var m = document.getElementById("models_overheads_pub_yearly").value;
        var n = document.getElementById("models_overheads_acc_yearly").value;

        var restotal = Number(k) + Number(l) + Number(m) + Number(n);

        // Calculations
        var yeartotal = non_restotal + restotal;
        var quarterlytotal = Number(yeartotal) / 4;
        var monthlytotal = Number(yeartotal) / 12;
        var dailytotal = Number(yeartotal) / 365;

        // Totals Input
        document.getElementById("yearlytotal").innerHTML = yeartotal.format_number(2);
        document.getElementById("quartelytotal").innerHTML = quarterlytotal.format_number(2);
        document.getElementById("monthlytotal").innerHTML = monthlytotal.format_number(2);
        document.getElementById("dailytotal").innerHTML = dailytotal.format_number(2);
    };

    Number.prototype.format_number = function(n,x) {
        let re = `\\d(?=(\\d{${x||3}})+${(n > 0 ? '\\.': '$')})`;
        return this.toFixed(Math.max(0,~~n)).replace(new RegExp(re,'g'), '$&,');
    }
    // For calculated models
    function updateInput() {
        return new Promise((res, rej) => {
            <?php if($overheadmodels): foreach ($overheadmodels as $key => $overheadmodel) : ?>
                // Assign value to each corresponding elements
                $('#'+'<?=$key?>').val('<?=$overheadmodel;?>');
            <?php endforeach; endif?>
            res('Done');
        });
    }

    // Calculate Overhead Breakdown automatically
    $('input[name^=models_overheads_]').on('input', function() {
        cal1();cal2();cal3();cal4();overheasdcal()
    })
    // Checking if models status
    // Execute if it is completed
    // @value must the same
    <?php if($overheadmodels): ?>
        if('<?=$overheadmodels->models_status ?>' == 'Completed') {
            $('form .hid').html(`<input type="hidden" name="models_overheads_id" id="models_overheads_id">`);
            updateInput().then((d) => {
                // call calculating function 
                cal1();cal2();cal3();cal4();overheasdcal()
                //initiate form tag
                // var form = document.querySelector('form');
                // assign all form child element to elements variable
                // var elements = form.elements;
                // iterate through elements
                // for(var i = 0, len = elements.length; i < len; ++i) {
                    // Disabled all input/textarea elements
                    // elements[i].readOnly ? elements[i].readOnly = false : true
                    // elements[i].readOnly = false;
                    // Disable all button element under form
                    // elements[i].disabled = false;
                    // console.log(elements[i].readOnly)
                // }

            });
        };
    <?php endif ?>
</script>