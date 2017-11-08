function Pizza(json) {
    angular.extend(this, json);

    var self = this;

    this.tieneIngrediente= function(ingrediente){
    	for (var i = 0; i < self.ingredientes.length; i++) {
    		if(self.ingredientes[i].id == ingrediente.id){
    			return true;
    		}
    	}
    	return false;
    };
    
  }