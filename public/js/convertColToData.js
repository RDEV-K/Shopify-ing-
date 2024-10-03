
function findLastInnerElement(parentElement) {
    const children = parentElement.children;

    if(children.length === 0) {
        return parentElement;
    }else {
        const lastChild = children[children.length -1];
        return findLastInnerElement(lastChild);
    }
}

function getValue() {}

function isEmpty(obj) {
    return Object.keys(obj).length === 0;
}

const page_data = [];
function convertTableToData() {
    return new Promise((res, rej) => {
        try {
            const eachParent = document.querySelectorAll('.card');
            $.each(eachParent, (index, element) => {
                let table = {};

                // Table Title
                let header = element.querySelector(".card-header");
                // console.log(header)
                let title = findLastInnerElement(header);
                table.title = title.innerText;

                // Table Data
                let dataObj = element.querySelectorAll(".table-data");
                let rawData = element.querySelector(".table-data");
                if(!isEmpty(dataObj)) {

                    if($(dataObj).length > 1) {
                        let more_tableData = [];
                        $.each(dataObj, (rIndex, rValue) => {
                            let row = rValue.children;
                            more_tableData.push(...rows(row));
                        });
                        table.data = more_tableData;

                    }else {
                        let row = rawData.children;
                        table.data = rows(row);
                    }
                }
                page_data.push(table);
            })
            res(page_data);
            
        } catch (error) {
            rej(error);
        }
    })
}

function rows(row) {
    if(!isEmpty(row)) {
        let row_data = [];
        $.each(row, (row_index, row_value) => {
            var rowChild = row_value.children;
            if(!isEmpty(rowChild)) {
                var cellObj = [];
                $.each(rowChild, (r_c_index, r_c_value) => {
                    let lastElementTag = findLastInnerElement(r_c_value);
                    if (lastElementTag.tagName === "INPUT") {
                        let attributeValue = lastElementTag.getAttribute('type');
                        let ifChecked = lastElementTag.getAttribute('checked');
                        if (attributeValue && attributeValue.includes('checkbox')) {
                            if (ifChecked) {
                                cellObj.push({
                                    label: "Checked",
                                    header: false
                                });
                            } else {
                                cellObj.push({
                                    label: "False",
                                    header: false
                                });
                            }
                        } else {
                            cellObj.push({
                                label: lastElementTag.value,
                                header: false
                            });
                        }
                    } else {
                        if (["TH","B","STRONG"].includes(lastElementTag.tagName)) {
                            cellObj.push({
                                label: lastElementTag.innerText,
                                header: true
                            });
                        } else {
                            cellObj.push({
                                label: lastElementTag.innerText,
                                header: false
                            });
                        }
                    }
                });
                row_data.push(cellObj);
            }
        });
        return row_data;
    }
    return [];
}