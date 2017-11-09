package org.domino.dominio;
 
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.annotation.*;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum Distribucion {
	TODA {
		@Override
		public String getName() {
			return "Toda la pizza";
		}
	},
	IZQUIERDA {
		@Override
		public String getName() {
			return "Izquierda";
		}
	},
	DERECHA {
		@Override
		public String getName() {
			return "Derecha";
		}
	},
	NOTSELECTED {
		@Override
		public String getName() {
			return "";
		}
	};
	
	@JsonValue
	public abstract String getName();
	
}
