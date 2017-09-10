package org.domino.dominio

import java.util.concurrent.TimeUnit

class Cronometro {

	boolean estaCorriendo
	long tiempoInicio
	long tiempoTranscurrido
	//Instant inicio
	//Instant llegada
	
	new(){
		estaCorriendo = false
		tiempoInicio = 0
		tiempoTranscurrido = 0
	}

    def activar() {
        if (!estaCorriendo){
        	tiempoInicio = System.nanoTime()
            estaCorriendo = true
        }
        //inicio = Instant.now()
        //llegada = Instant.now()
    }

	def detener(){
		if (estaCorriendo) {
            tiempoTranscurrido += System.nanoTime() - tiempoInicio;
            estaCorriendo = false;
		}
		//llegada = Instant.now()
	}

	def tiempoEnNanos() {
        if (estaCorriendo) {
            return System.nanoTime() - tiempoInicio;
        }
        return tiempoTranscurrido
    }

    def tiempoEnMinutos() {
        TimeUnit.MINUTES.convert(tiempoTranscurrido, TimeUnit.NANOSECONDS)
    }

	/* 
	
    def Duration tiempo() {
        return Duration.between( inicio , llegada )
    }

    def long tiempoConvertido(TimeUnit unit) {
        return unit.convert(tiempo(), TimeUnit.MILLISECONDS)
    }
    
    def long tiempoConvertido(){
    	val res = Duration.between( inicio , llegada )
    	return res.toNanos
    }

    */

}
