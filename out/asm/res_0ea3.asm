; res_0ea3 file_off 0x10a30

res_0ea3_0000:  ; ENTRY
  0000  06               push es                                  
  0001  55               push bp                                  
  0002  b84000           mov ax, 0x40                             
  0005  8ec0             mov es, ax                               
  0007  268b166300       mov dx, word ptr es:[0x63]               
  000c  89167433         mov word ptr [0x3374], dx                
  0010  cd12             int 0x12                                 
  0012  a37633           mov word ptr [0x3376], ax                
  0015  3df000           cmp ax, 0xf0                             
  0018  7d02             jge 0x1c                                 
  001a  eb31             jmp 0x4d                                 
  001c  3d0001           cmp ax, 0x100                            
  001f  7f05             jg 0x26                                  
  0021  b80100           mov ax, 1                                
  0024  eb21             jmp 0x47                                 
  0026  3d8001           cmp ax, 0x180                            
  0029  7f05             jg 0x30                                  
  002b  b80300           mov ax, 3                                
  002e  eb17             jmp 0x47                                 
  0030  3d0002           cmp ax, 0x200                            
  0033  7f05             jg 0x3a                                  
  0035  b80500           mov ax, 5                                
  0038  eb0d             jmp 0x47                                 
  003a  3d8002           cmp ax, 0x280                            
  003d  7f05             jg 0x44                                  
  003f  b80700           mov ax, 7                                
  0042  eb03             jmp 0x47                                 
  0044  b80900           mov ax, 9                                
  0047  a37833           mov word ptr [0x3378], ax                
  004a  5d               pop bp                                   
  004b  07               pop es                                   
  004c  cb               retf                                     
  004d  b8ffff           mov ax, 0xffff                           
  0050  5d               pop bp                                   
  0051  07               pop es                                   
  0052  cb               retf                                     
  0053  89168433         mov word ptr [0x3384], dx                
  0057  89168233         mov word ptr [0x3382], dx                
  005b  b80100           mov ax, 1                                
  005e  e9da00           jmp 0x13b                                
  0061  c3               ret                                      
  0062  89168433         mov word ptr [0x3384], dx                
  0066  89168233         mov word ptr [0x3382], dx                
  006a  b80200           mov ax, 2                                
  006d  e9cb00           jmp 0x13b                                
  0070  c3               ret                                      
  0071  89168433         mov word ptr [0x3384], dx                
  0075  89168233         mov word ptr [0x3382], dx                
  0079  b80400           mov ax, 4                                
  007c  e9bc00           jmp 0x13b                                
  007f  c3               ret                                      
  0080  b80a00           mov ax, 0xa                              
  0083  c7068c330100     mov word ptr [0x338c], 1                 
  0089  e9af00           jmp 0x13b                                

res_0ea3_008c:  ; ENTRY
  008c  55               push bp                                  
  008d  8bec             mov bp, sp                               
  008f  06               push es                                  
  0090  55               push bp                                  
  0091  b8001a           mov ax, 0x1a00                           
  0094  cd10             int 0x10                                 
  0096  ba0100           mov dx, 1                                
  0099  3c1a             cmp al, 0x1a                             
  009b  750e             jne 0xab                                 
  009d  80fb07           cmp bl, 7                                
  00a0  7405             je 0xa7                                  
  00a2  80fb08           cmp bl, 8                                
  00a5  7504             jne 0xab                                 
  00a7  89168833         mov word ptr [0x3388], dx                
  00ab  837e0600         cmp word ptr [bp + 6], 0                 
  00af  747f             je 0x130                                 
  00b1  837e0601         cmp word ptr [bp + 6], 1                 
  00b5  749c             je 0x53                                  
  00b7  837e0602         cmp word ptr [bp + 6], 2                 
  00bb  74a5             je 0x62                                  
  00bd  837e0604         cmp word ptr [bp + 6], 4                 
  00c1  74ae             je 0x71                                  
  00c3  837e060a         cmp word ptr [bp + 6], 0xa               
  00c7  74b7             je 0x80                                  
  00c9  837e0603         cmp word ptr [bp + 6], 3                 
  00cd  743c             je 0x10b                                 
  00cf  837e060a         cmp word ptr [bp + 6], 0xa               
  00d3  747b             je 0x150                                 
  00d5  837e060a         cmp word ptr [bp + 6], 0xa               
  00d9  7503             jne 0xde                                 
  00db  e9c000           jmp 0x19e                                
  00de  837e060a         cmp word ptr [bp + 6], 0xa               
  00e2  7503             jne 0xe7                                 
  00e4  e9ac00           jmp 0x193                                
  00e7  b8001a           mov ax, 0x1a00                           
  00ea  cd10             int 0x10                                 
  00ec  3c1a             cmp al, 0x1a                             
  00ee  7534             jne 0x124                                
  00f0  80fb07           cmp bl, 7                                
  00f3  7425             je 0x11a                                 
  00f5  80fb08           cmp bl, 8                                
  00f8  7420             je 0x11a                                 
  00fa  80fb0a           cmp bl, 0xa                              
  00fd  740c             je 0x10b                                 
  00ff  80fb0b           cmp bl, 0xb                              
  0102  7407             je 0x10b                                 
  0104  80fb0c           cmp bl, 0xc                              
  0107  7402             je 0x10b                                 
  0109  eb19             jmp 0x124                                
  010b  89168633         mov word ptr [0x3386], dx                
  010f  89168233         mov word ptr [0x3382], dx                
  0113  b80300           mov ax, 3                                
  0116  5d               pop bp                                   
  0117  07               pop es                                   
  0118  5d               pop bp                                   
  0119  cb               retf                                     
  011a  89168833         mov word ptr [0x3388], dx                
  011e  89168433         mov word ptr [0x3384], dx                
  0122  eb10             jmp 0x134                                
  0124  b412             mov ah, 0x12                             
  0126  b310             mov bl, 0x10                             
  0128  2bc9             sub cx, cx                               
  012a  cd10             int 0x10                                 
  012c  2bc0             sub ax, ax                               
  012e  e311             jcxz 0x141                               
  0130  89168433         mov word ptr [0x3384], dx                
  0134  89168233         mov word ptr [0x3382], dx                
  0138  b80000           mov ax, 0                                
  013b  eb6a             jmp 0x1a7                                
  013d  5d               pop bp                                   
  013e  07               pop es                                   
  013f  5d               pop bp                                   
  0140  cb               retf                                     
  0141  b800f0           mov ax, 0xf000                           
  0144  8ec0             mov es, ax                               
  0146  bb00c0           mov bx, 0xc000                           
  0149  268b07           mov ax, word ptr es:[bx]                 
  014c  3c21             cmp al, 0x21                             
  014e  7537             jne 0x187                                
  0150  89167c33         mov word ptr [0x337c], dx                
  0154  ff0e7833         dec word ptr [0x3378]                    
  0158  813e7633f000     cmp word ptr [0x3376], 0xf0              
  015e  7f04             jg 0x164                                 
  0160  89167a33         mov word ptr [0x337a], dx                
  0164  813e76337001     cmp word ptr [0x3376], 0x170             
  016a  7c06             jl 0x172                                 
  016c  837e060a         cmp word ptr [bp + 6], 0xa               
  0170  7506             jne 0x178                                
  0172  89167e33         mov word ptr [0x337e], dx                
  0176  eb26             jmp 0x19e                                
  0178  89168233         mov word ptr [0x3382], dx                
  017c  89168033         mov word ptr [0x3380], dx                
  0180  b80a00           mov ax, 0xa                              
  0183  5d               pop bp                                   
  0184  07               pop es                                   
  0185  5d               pop bp                                   
  0186  cb               retf                                     
  0187  bad403           mov dx, 0x3d4                            
  018a  90               nop                                      
  018b  0e               push cs                                  
  018c  e82900           call 0x1b8                               
  018f  7202             jb 0x193                                 
  0191  eb0b             jmp 0x19e                                
  0193  c7068a330100     mov word ptr [0x338a], 1                 
  0199  b80a00           mov ax, 0xa                              
  019c  eb09             jmp 0x1a7                                
  019e  b80a00           mov ax, 0xa                              
  01a1  c7068c330100     mov word ptr [0x338c], 1                 
  01a7  833e783307       cmp word ptr [0x3378], 7                 
  01ac  7c06             jl 0x1b4                                 
  01ae  c70678330700     mov word ptr [0x3378], 7                 
  01b4  5d               pop bp                                   
  01b5  07               pop es                                   
  01b6  5d               pop bp                                   
  01b7  cb               retf                                     

res_0ea3_01b8:  ; ENTRY
  01b8  b00f             mov al, 0xf                              
  01ba  ee               out dx, al                               
  01bb  42               inc dx                                   
  01bc  ec               in al, dx                                
  01bd  8ae0             mov ah, al                               
  01bf  b066             mov al, 0x66                             
  01c1  ee               out dx, al                               
  01c2  b90001           mov cx, 0x100                            
  01c5  e2fe             loop 0x1c5                               
  01c7  ec               in al, dx                                
  01c8  86e0             xchg al, ah                              
  01ca  ee               out dx, al                               
  01cb  80fc66           cmp ah, 0x66                             
  01ce  7401             je 0x1d1                                 
  01d0  f9               stc                                      
  01d1  cb               retf                                     
  01d2  b8               db b8                                    
