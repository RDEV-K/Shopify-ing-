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

        <!-- View Modal Manu -->
        <div class="modal fade" id="viewModalMan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewModal">View Batch Certificate</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- View Modal Manu -->

        <div class="row text-center">
            <a href="https://ingrevo.com/production-certificates/" target="_blank"><i id="help-icon"
                    class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
        </div>

        <div class="row">
            <table id="example1" class="display text-center nowrap mt-3">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Product</th>
                        <th>Version</th>
                        <th>Batch #</td>
                        <th>Qty (g)</th>
                        <th>View</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($manuprod): ?>
                        <?php foreach ($manuprod as $data): ?>
                            <tr>
                                <td><?= $data->manuf_product_date; ?></td>
                                <td><?= $data->formula_rdplan; ?></td>
                                <td><?= $data->formula_version; ?></td>
                                <td><?= $data->manuf_product_batch; ?></td>
                                <td><?= $data->manuf_product_qty; ?></td>
                                <td>
                                    <a href="<?= base_url() ?>/batchcertificatesviewman/csv/<?= $data->manuf_product_id ?>"
                                        class="btn btn-success btn-sm">CSV</a>
                                    <a class="btn btn-success btn-sm" onclick="viewman(<?= $data->manuf_product_id ?>)">View</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Date</th>
                        <th>Product</th>
                        <th>Version</th>
                        <th>Batch #</td>
                        <th>Qty (g)</th>
                        <th>View</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </main>
</div>

<script>
    // Table
    $(document).ready(function () {
        // $('#example1').DataTable( {
        //     "paging":   false,
        //     "autowidth": true,
        //     "responsive": true,
        //     "order": [[ 0, "desc" ]],
        // } );
        var table = $('#example1').DataTable({
            colReorder: true, // Enable column reordering
            responsive: true, // Enable responsive behavior
            paging: false, // Disable paging
            autowidth: true, // Enable auto width
            order: [[0, "desc"]], // Order by date descending by default
        });
        function reorderColumns() {
            var screenWidth = window.innerWidth;
            if (screenWidth < 768) { // For mobile devices
                table.colReorder.order([3, 1, 2, 4, 0, 5], true); // Reorder columns
            } else { // For larger screens
                table.colReorder.order([0, 1, 2, 3, 4, 5], true); // Default order
            }
        }
        // Reorder columns on initial load and on resize
        reorderColumns();
        $(window).resize(reorderColumns);
    });

    var root = '<?= base_url() ?>'

    // View
    function viewman($manuf_product_id) {
        $("#viewModalMan .modal-body").load(root + "/batchcertificatesviewman/" + $manuf_product_id)
        var viewModal = new bootstrap.Modal(document.querySelector("#viewModalMan"));
        viewModal.show()
    }

    function viewrd($product_id) {
        $("#viewModalRD .modal-body").load(root + "/batchcertificatesviewrd/" + $product_id)
        var viewModal = new bootstrap.Modal(document.querySelector("#viewModalRD"));
        viewModal.show()
    }
</script>