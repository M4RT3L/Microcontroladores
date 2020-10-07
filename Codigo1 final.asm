#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program

i equ 0x50        ;variable i en la localidad 0x30
j equ 0x51
k equ 0x52
r equ 0x53

START              ;inicio global del programa


    MOVLW 0x07         ;Apagar comparadores para trabajar en modo digital
    MOVWF CMCON    
    BCF STATUS, RP1    ;Cambiar al banco 1 apagando el RP1
    BSF STATUS, RP0    ;Y encendiendo el RP0
    MOVLW b'00000000'  ;Establecer puerto B como salida (los 8 bits del puerto)
    MOVWF TRISB 
    BCF STATUS, RP0    ;Regresar al banco 0 apagando el RP0

INICIO
    MOVLW 'E'
    MOVWF 0x20
    MOVLW 'M'
    MOVWF 0x21
    MOVLW 'I'
    MOVWF 0x22
    MOVLW 'L'
    MOVWF 0x23
    MOVLW 'I'
    MOVWF 0x24
    MOVLW 'O'
    MOVWF 0x25
    
    MOVLW 'M'
    MOVWF 0x30
    MOVLW 'A'
    MOVWF 0x31
    MOVLW 'R'
    MOVWF 0x32
    MOVLW 'T'
    MOVWF 0x33
    MOVLW 'E'
    MOVWF 0x34
    MOVLW 'L'
    MOVWF 0x35
    
    MOVLW 'C'
    MOVWF 0x40
    MOVLW 'H'
    MOVWF 0x41
    MOVLW 'A'
    MOVWF 0x42
    MOVLW 'V'
    MOVWF 0x43
    MOVLW 'E'
    MOVWF 0x44
    MOVLW 'Z'
    MOVWF 0x45
    
    MOVLW 6 ; emilio 
    MOVWF i
    MOVLW 6 ;martel
    MOVWF j
    MOVLW 6 ;Chavez
    MOVWF k
    
    CLRF r
    MOVFW i
    ADDWF r,f
    MOVFW j
    ADDWF r,f
    MOVFW k
    ADDWF r,f
    
;Aquí va la rutina principal
    GOTO INICIO        ;loop inicio			
END