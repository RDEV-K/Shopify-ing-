<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<section class="section expad"> 

<div class="no mt-3 pt-3 mb-3 pb-3">
    <div class="container col-md-6 col-lg-4">
        <div class="card">
            <strong><div class="card-header">Your Profile</div></strong>
            <div class="card-body">
                <form method="post" id="update_entry" name="update_entry" action="<?= base_url() ?>/corporate_staff_update">

                <div class="row">
                    <div class="col">
                        <input type="hidden" name="user_id" id="user_id" value="<?= $users['user_id']; ?>">

                        <div class="form-group row mb-3">
                            <label class="col-sm-4 col-form-label">First Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_first_name"  name="user_first_name" value="<?= $users['user_first_name']; ?>" required>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-4 col-form-label">Last Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_last_name"  name="user_last_name" value="<?= $users['user_last_name']; ?>" required>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-4 col-form-label">Password</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control <?php if(session()->getFlashdata('msg')):?>border-danger <?php endif ?>" <?php if(session()->getFlashdata('msg')):?>autofocus <?php endif ?> id="user_password" name="user_password" value="" placeholder="Password" required>
                            </div>                            
                            <?php if(session()->getFlashdata('msg')):?>
                                <span class="col-sm-8 text-muted offset-4" style="color: red !important;"><?= session()->getFlashdata('msg') ?></span> 
                            <?php endif;?>

                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-4 col-form-label">Email Address</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_email"  value="<?= $users['user_email']; ?>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-4 col-form-label">Subscription Status</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="stripe_subscription_status" name="stripe_subscription_status" value="<?= $users['stripe_subscription_status']; ?>" readonly>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Manage Subscription</div>
                            <div class="col-sm-8"><a class="btn-klean-active btn" href="https://ingrevo.com/account/">Manage</a></div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <a href="https://ingrevo.com/profile-billing/" target="_blank"><i id="help-icon" class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a> 
                        <button type="submit" class="btn btn-success">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $('#logout').click(function() {
        localStorage.removeItem('signup');
    })
</script>