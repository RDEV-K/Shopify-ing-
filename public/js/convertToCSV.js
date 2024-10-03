function convertToCSV(objArray) {
  var array = typeof objArray != "object" ? JSON.parse(objArray) : objArray;
  var str = "";

  for (var i = 0; i < array.length; i++) {
    // if (window.CP.shouldStopExecution(0)) break;
    var line = "";
    for (var index in array[i]) {
      if (line != "") line += ",";

      line += array[i][index];
    }

    str += line + "\r\n";
  }
//   window.CP.exitedLoop(0);
  return str;
}

function exportCSVFile(headers, items, fileTitle, headerInfo=null) {
  if (headers) {
    items.unshift(headers);
  }
  if (headerInfo) {
    $.each(headerInfo, (index, value) => {
      items.unshift(value);
    });
  }
  // Convert Object to JSON
  var jsonObject = JSON.stringify(items);

  var csv = this.convertToCSV(jsonObject);

  var exportedFilenmae = fileTitle + ".csv" || "export.csv";

  var blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
  if (navigator.msSaveBlob) {
    // IE 10+
    navigator.msSaveBlob(blob, exportedFilenmae);
  } else {
    var link = document.createElement("a");
    if (link.download !== undefined) {
      // feature detection
      // Browsers that support HTML5 download attribute
      var url = URL.createObjectURL(blob);
      link.setAttribute("href", url);
      link.setAttribute("download", exportedFilenmae);
      link.style.visibility = "hidden";
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  }
}

function download(rawData) {
  const { data: itemsNotFormatted, header: headers, title, headerInfo } = rawData;

  var itemsFormatted = [];
  var main_header = [];

  $.each(headers, function (indexInArray, label) {
    main_header.push(label);
  });

  // format the data
  $.each(itemsNotFormatted, (data_index, item) => {
    let rowData = {};
    $.each(headers, function (indexInArray, label) {
      // console.log(item[indexInArray] !== '' ? "Yess" : "No", typeof item[indexInArray]);
      rowData[indexInArray] = item[indexInArray] !== '' ? (item[indexInArray]).toString().replace(/,/g, "") : '';
    });
    itemsFormatted.push(rowData);
  });
  var headInfo = [];

  // format headInformation if available
  if (headerInfo) {
    $.each((headerInfo[1]),(index, value) => {
      let headRow = [
        value, headerInfo[0][index]
      ];
      headInfo.push(headRow);
    });
    headInfo.push({});
    headInfo = headInfo.reverse();
  }

  // csv name
  let now = new Date();
  var fileTitle = title+"_"+now.getTime();
  exportCSVFile(main_header, itemsFormatted, fileTitle, headInfo);
}
