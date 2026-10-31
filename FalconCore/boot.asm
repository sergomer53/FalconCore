[org 0x7c00]

; 1. IL SUONO DI AVVIO (BIP)
; Attiva la cassa del computer
in al, 0x61
or al, 3
out 0x61, al

; Imposta la frequenza del suono (la nota musicale)
mov al, 0xb6
out 0x43, al
mov ax, 2000      ; Frequenza del bip
out 0x42, al
mov al, ah
out 0x42, al

; Fa suonare il computer per un brevissimo istante (piccola pausa)
mov cx, 0xFFFF
pausa_suono:
    loop pausa_suono

; Spegne la cassa per non farla fischiare all'infinito
in al, 0x61
and al, 0xfc
out 0x61, al


; 2. ATTIVA LA MODALITÀ GRAFICA A 256 COLORI
mov ah, 0x00
mov al, 0x13
int 0x10

; 3. COLORIAMO LO SFONDO DI BLU SCURO
mov ah, 0x0c
mov al, 1        ; 1 = Blu Scuro
mov cx, 0        

pulisci_sfondo:
    mov dx, 0    
riga_sfondo:
    int 0x10
    inc dx
    cmp dx, 200  
    jl riga_sfondo
    inc cx
    cmp cx, 320  
    jl pulisci_sfondo

; 4. DISEGNIAMO IL FALCO GEOMETRICO
; Ala sinistra azzurra (Colore 11)
mov ah, 0x0c
mov al, 11       
mov cx, 110      
ala_sinistra:
    mov dx, 70   
linea_ala:
    int 0x10
    inc dx
    cmp dx, 130  
    jl linea_ala
    inc cx
    cmp cx, 150  
    jl ala_sinistra

; Ala destra azzurra (Colore 11)
mov cx, 170      
ala_destra:
    mov dx, 70
linea_ala_d:
    int 0x10
    inc dx
    cmp dx, 130
    jl linea_ala_d
    inc cx
    cmp cx, 210
    jl ala_destra

; Testa gialla (Colore 14)
mov al, 14       
mov cx, 150
testa:
    mov dx, 85
linea_testa:
    int 0x10
    inc dx
    cmp dx, 115
    jl linea_testa
    inc cx
    cmp cx, 170
    jl testa

; 5. BLOCCO DI SICUREZZA CONTINUO
fine:
    jmp $

times 510-($-$$) db 0
dw 0xaa55