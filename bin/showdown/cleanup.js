// node cleanup.
// this script removes unnecessairy keys from the downloaded files
// utilises underscore's omit()

var _ = require('underscore');
var fs = require('fs');

(function(){
    console.log(process.cwd())
    var config = {
        data:  process.argv[2],
        files: JSON.parse(process.argv[3])
    }
    
    var groups = Object.keys(config.files);
    for (var i = 0, len = groups.length; i < len; i++){
        var files = config.files[groups[i]];

        console.log("Cleaning gorup: " + groups[i])

        for (var j = 0, _len = files.length; j < _len; j++){
            var file = files[j];
            console.log("Cleanup: " + file);
            var module = require(process.cwd() + "/" + config.data  + groups[i] + '/' + file);
            var json = module[Object.keys(module)[0]];
            fs.writeFileSync(config.data + groups[i] + '/' + file, JSON.stringify(json));
            console.log("Done. Next file");            
        }
        console.log("Done. next group");
    }
    console.log("Done.");
})()