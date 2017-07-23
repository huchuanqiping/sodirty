module.exports = function(json){
    json.warningStatus = JSON.stringify(json.warningStatus);
    return json;
};