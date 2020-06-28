// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
    data: [
      [1,"Võ Ngọc Trọng***", "Canh chua ngon quá", "12/06/2020"],
      [2,"Võ Ngọc Trọng***", "Con muốn donate cho bác nấu canh chua", "10/06/2020"],
      [3,"Võ Ngọc Trọng***", "Mai nấu canh chua tiếp nha bác", "30/05/2020"],
      [4,"Võ Ngọc Trọng", "Canh chua là số 1", "29/05/2020"],
      [5,"Võ Ngọc Trọng", "5 sao cho món canh chua", "28/05/2020"],
    ]
  });
});
