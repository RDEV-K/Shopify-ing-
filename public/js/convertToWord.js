
// docx 7.1
// Convert raw data to MS-Word table / text
// Written by Softdeph
const TableRow_fn = (docx, cells) => {
    const { TableRow } = docx;
    let rowProps =  { children: cells };
    return new TableRow(rowProps);
  }
  
  const TableCell_fn = (docx, label, header=false) => {
    const { TableCell,WidthType,BorderStyle,VerticalAlign,AlignmentType } = docx;
    let shading = {};
    if(header) {
        shading.fill = '000000'
    }
    let head_cell = new TableCell({
        children: [createParagraph(docx,label,header)],
        shading: shading,
        borders: {
            left: {
                style: BorderStyle.SINGLE, size:1, color: "000000"
            },
            right: {
                style: BorderStyle.SINGLE, size:1, color: "000000"
            },
            top: {
                style: BorderStyle.NONE
            },
            bottom: {
                style: BorderStyle.NONE
            }
        },
        width: { size: 0, type: WidthType.AUTO},
        verticalAlign: VerticalAlign.CENTER,
        alignment: AlignmentType.CENTER
    });
    return head_cell;
}

const createParagraph = (docx, text, bold=false,label=false) => {
    const { TextRun,Paragraph } = docx;
    let textProps = { text };
    textProps.noWrap = true;
    if (bold) {
        textProps.bold = true;
        textProps.color = 'ffffff';
    };
    if (label) {
        textProps.bold = true;
        textProps.color = '000000';
    };
    return new Paragraph({
        children: [new TextRun(textProps)]
    });
}
  
function isEmpty(obj) {
    return Object.keys(obj).length === 0;
}
  
function generate(rawData) {    
    const { Document, Packer, Table, WidthType } = docx;
    if (!isEmpty(rawData)) {
        let tableHeaderCell = [];
        let tableHeaderRow = null;
        let tableBody = [];
        const msTable = [];
        $.each(rawData, (index, rawDataValue) => {
            const { data, title } = rawDataValue;
            
            // Generating Table body content
            let tableBodyRow = [];
            $.each(data, async(data_index, data_value) => {
                let header = 0;
                if(data_index == 0) header = 1;
                let tableBodyCell = [];
                $.each(data_value, (head_index, value_obj) => {

                    tableBodyCell.push(TableCell_fn(docx, value_obj.label, value_obj.header));
                });
                if(header){
                    tableBodyRow.push(TableRow_fn(docx, tableBodyCell, header));
                }else {
                    tableBodyRow.push(TableRow_fn(docx, tableBodyCell));
                }
                header = 0;
            });
        
            // return;
            let tableRows = [];
            if (tableBodyRow) {
                tableBody = [...tableBodyRow];
            }
            const table = new Table({
                columnWidths: [1505,1100,1100,1100,1100,1100,1100,1100,1100,1100,1100,1100],
                width: { size: 100, type: WidthType.PERCENTAGE},
                rows: tableBody
            });
            
            msTable.push(createParagraph(docx,title,true,true));
            msTable.push(table);
            msTable.push(createParagraph(docx,"",false));
            // msTable.push("")
        });
        // console.log(msTable);
        const msDoc = new Document({
            sections: [{
                children: msTable
            }]
        });
        Packer.toBlob(msDoc).then((blob) => {
            var now = new Date();
            var title = now.getTime();
            saveAs(blob, title+".docx");
        });
    }
    return;
  }
