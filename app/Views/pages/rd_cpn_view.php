<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<div class="expad no mt-3 col-12">

  <main role="main" class="col-md-12 ml-sm-auto col-lg-12 pt-3 px-4">
    
    <div class="row">
      <div class="col-lg-3 mb-5">
        <table id="example1" class="table table-striped border-top">
          <tr>
              <th>Date</th>
              <td><?php echo $cpn[0]->cpn_date; ?></td>
          </tr>
          <tr>
              <th>Formula</th>
              <td><?php echo $cpn[0]->formula_version; ?> <?php echo $cpn[0]->formula_rdplan; ?></td>
          </tr>
          <tr>
              <th>Responsible Person</th>
              <td><?php echo $cpn[0]->cpn_rp; ?></td>
          </tr>
        </table>
      </div>

      <?php $file_tmpName=null;$dir=null; if(!empty($file_history)){
          $fileCount = count($file_history);
              $file_tmpName = $file_history[$fileCount-1]->file_upload;
              $dir = $file_history[$fileCount-1]->file_directory;
          }
        ?>

      <div class="col-lg-9">
        <div id="container">
          <?php if(!empty($file_history)) : $fileName = !$file_tmpName ? "No" : $file_tmpName;   $dr = !$dir ? "No" : $dir; ?>
              <iframe id="d_file" src="<?= base_url() ?>/preview_file/PIF Files/<?= $fileName ?>/<?= $dr?>/" width="100%" height="650px" a></iframe>
              <?php else : ?>
              <iframe id="d_file" src="<?= base_url() ?>/fetch_file/PIF Files/invalid/<?= $dir?>/" width="100%" height="650px" a></iframe>
          <?php endif ?>
        </div>
      </div>
    </div>

  </main>

</div>

<script>

  // Table 
    $(document).ready(function() {
      $('#example1').DataTable( {
        "paging":   false,
        "autowidth": true,
      });
    });

</script>
	