package org.domino.dominio;

public enum Distribucion {
	TODA {
		@Override
		public String getName() {
			return "Toda";
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
	public abstract String getName();
}