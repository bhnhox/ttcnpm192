// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
    data: [
      [1,"Võ Ngọc Trọng", "Canh chua, cá kho, thịt sườn", "28/05/2020", 50000],
      [2,"Võ Ngọc Trọng", "Canh chua, cá kho, thịt sườn", "29/05/2020", 50000],
      [3,"Võ Ngọc Trọng", "Canh chua, cá kho, đậu hũ", "30/05/2020", 50000],
      [4,"Võ Ngọc Trọng", "Canh chua, cá kho, thịt sườn", "10/06/2020", 50000],
      [5,"Võ Ngọc Trọng", "Canh chua, trứng, thịt sườn", "12/06/2020", 50000],
    ]
  });
});
