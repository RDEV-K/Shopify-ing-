<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag() { dataLayer.push(arguments); }
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<div class="expad no mt-3 pt-3">

  <main role="main" class="col-md-12 ml-sm-auto col-lg-12 pt-3 px-3">

    <div class="row mb-3 pb-3 text-center">
      <div class="col">
        <button type="button" class="btn btn-sm btn-success text-center" data-bs-toggle="modal"
          data-bs-target="#entryModal">Upload Policy</button>
        <a href="https://ingrevo.com/pif/" target="_blank"><i id="help-icon" class="fa-solid fa-circle-info fa-2xl"
            data-toggle="tooltip" title="How To Guide"></i><a>
      </div>
    </div>

    <!-- Modals -->

    <!-- Add Modal -->
    <div class="modal fade" id="entryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Upload Policy</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form method="post" id="add_entry" name="add_entry" action="<?= base_url() ?>/rd_cpn_add"
              enctype="multipart/form-data">

              <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label">Date</label>
                <div class="col-sm-8">
                  <input type="date" class="form-control" id="cpn_date" name="cpn_date"
                    placeholder="<?php echo date('d/m/Y'); ?>" value="<?php echo date('Y-m-d'); ?>" required>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="inputPassword3" class="col-sm-4 col-form-label">Policy Name</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="cpn_rp" name="cpn_rp" required>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label">Upload</label>
                <div class="col-sm-8">
                  <input type="file" class="form-control file file_add" id="invoice_file" name="invoice_file" required>
                </div>
              </div>

              <input type="hidden" name="cpn_user" id="cpn_user" value="<?php echo $_SESSION['user_id']; ?>">

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
                <button type="submit" name="insertdata" class="btn btn-success add_ib">Save</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- Add Modal -->

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Edit Policy</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">

          </div>
        </div>
      </div>
    </div>
    <!-- Edit Modal -->

    <!-- Modals -->

    <!-- Table -->

    <div class="row">
      <table id="example1" class="display text-center mt-3">
        <thead>
          <tr>
            <th>Date</th>
            <th>Policy</th>
            <th>Version</th>
            <th>Options</th>
          </tr>
        </thead>
        <tbody>
          <?php if ($cpn): ?>
            <?php foreach ($cpn as $data): ?>
              <tr>
                <td><?php echo $data->formula_version; ?>     <?php echo $data->formula_rdplan; ?></td>
                <td><?php echo $data->cpn_rp; ?></td>
                <td><?php echo $data->cpn_rp; ?></td>
                <td style="min-width:150px;">
                  <a class="btn btn-success btn-sm" href="<?= base_url() ?>/rd_cpn_view/<?= $data->cpn_id ?>">View</a>
                  <a class="btn btn-primary btn-sm" onclick="edit(<?= $data->cpn_id ?>)">Edit</a>
                  <a href="<?= base_url() ?>/rd_cpn_delete/<?= $data->cpn_id ?>" class="btn btn-danger btn-sm">Delete</a>
                </td>
              </tr>
            <?php endforeach; ?>
          <?php endif; ?>
        </tbody>
        <tfoot>
          <tr>
          <th>Date</th>
            <th>Policy</th>
            <th>Version</th>
            <th>Options</th>
          </tr>
        </tfoot>
      </table>

      <!-- Table -->

  </main>

</div>

<script>

  let file = document.querySelector('.file_add');
  let form = document.querySelector('#add_entry');
  $('button.add_ib').click(function (e) {
    e.preventDefault();
    validateFile(file.files[0], form, 1);
  });
  function validateFile(file, form, req = null) {
    if (req) {
      if (!file) {
        alert("Please select a file to upload");
        return;
      }
      if (file.type !== 'application/pdf') {
        alert('File is not PDF format');
        return;
      }

      if (file.size > 2 * 1024 * 1024) {
        alert('File size exceeds the limit of 2MB');
        return;
      }

    }
    form.submit();
  }

  // Table
  $(document).ready(function () {
    $('#example1').DataTable({
      "paging": false,
      "autowidth": true,
      "responsive": true,
    });
  });

  var root = '<?= base_url() ?>'

  // Edit
  function edit(cpn_id = null) {
    $("#editModal .modal-body").load(root + "/rd_cpn_edit/" + cpn_id)
    var editModal = new bootstrap.Modal(document.querySelector("#editModal"))
    editModal.show()
  }

</script>