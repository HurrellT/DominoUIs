package org.domino.dominio;

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
	};
	
	public abstract String getName();

}
