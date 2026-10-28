; seg 06bd  img 0x6bd0..0x6da0  file off 0x77d0
  06bd:0000  06               push es                                  
  06bd:0001  55               push bp                                  
  06bd:0002  b84000           mov ax, 0x40                             
  06bd:0005  8ec0             mov es, ax                               
  06bd:0007  268b166300       mov dx, word ptr es:[0x63]               
  06bd:000c  89169206         mov word ptr [0x692], dx                 
  06bd:0010  cd12             int 0x12                                 
  06bd:0012  a39406           mov word ptr [0x694], ax                 
  06bd:0015  3df000           cmp ax, 0xf0                             
  06bd:0018  7d02             jge 0x1c                                 
  06bd:001a  eb31             jmp 0x4d                                 
  06bd:001c  3d0001           cmp ax, 0x100                            
  06bd:001f  7f05             jg 0x26                                  
  06bd:0021  b80100           mov ax, 1                                
  06bd:0024  eb21             jmp 0x47                                 
  06bd:0026  3d8001           cmp ax, 0x180                            
  06bd:0029  7f05             jg 0x30                                  
  06bd:002b  b80300           mov ax, 3                                
  06bd:002e  eb17             jmp 0x47                                 
  06bd:0030  3d0002           cmp ax, 0x200                            
  06bd:0033  7f05             jg 0x3a                                  
  06bd:0035  b80500           mov ax, 5                                
  06bd:0038  eb0d             jmp 0x47                                 
  06bd:003a  3d8002           cmp ax, 0x280                            
  06bd:003d  7f05             jg 0x44                                  
  06bd:003f  b80700           mov ax, 7                                
  06bd:0042  eb03             jmp 0x47                                 
  06bd:0044  b80900           mov ax, 9                                
  06bd:0047  a39606           mov word ptr [0x696], ax                 
  06bd:004a  5d               pop bp                                   
  06bd:004b  07               pop es                                   
  06bd:004c  cb               retf                                     
  06bd:004d  b8ffff           mov ax, 0xffff                           
  06bd:0050  5d               pop bp                                   
  06bd:0051  07               pop es                                   
  06bd:0052  cb               retf                                     
  06bd:0053  8916a206         mov word ptr [0x6a2], dx                 
  06bd:0057  8916a006         mov word ptr [0x6a0], dx                 
  06bd:005b  b80100           mov ax, 1                                
  06bd:005e  e9da00           jmp 0x13b                                
  06bd:0061  c3               ret                                      
  06bd:0062  8916a206         mov word ptr [0x6a2], dx                 
  06bd:0066  8916a006         mov word ptr [0x6a0], dx                 
  06bd:006a  b80200           mov ax, 2                                
  06bd:006d  e9cb00           jmp 0x13b                                
  06bd:0070  c3               ret                                      
  06bd:0071  8916a206         mov word ptr [0x6a2], dx                 
  06bd:0075  8916a006         mov word ptr [0x6a0], dx                 
  06bd:0079  b80400           mov ax, 4                                
  06bd:007c  e9bc00           jmp 0x13b                                
  06bd:007f  c3               ret                                      
  06bd:0080  b80a00           mov ax, 0xa                              
  06bd:0083  c706aa060100     mov word ptr [0x6aa], 1                  
  06bd:0089  e9af00           jmp 0x13b                                

proc_06bd_008c:
  06bd:008c  55               push bp                                  
  06bd:008d  8bec             mov bp, sp                               
  06bd:008f  06               push es                                  
  06bd:0090  55               push bp                                  
  06bd:0091  b8001a           mov ax, 0x1a00                           
  06bd:0094  cd10             int 0x10                                 
  06bd:0096  ba0100           mov dx, 1                                
  06bd:0099  3c1a             cmp al, 0x1a                             
  06bd:009b  750e             jne 0xab                                 
  06bd:009d  80fb07           cmp bl, 7                                
  06bd:00a0  7405             je 0xa7                                  
  06bd:00a2  80fb08           cmp bl, 8                                
  06bd:00a5  7504             jne 0xab                                 
  06bd:00a7  8916a606         mov word ptr [0x6a6], dx                 
  06bd:00ab  837e0600         cmp word ptr [bp + 6], 0                 
  06bd:00af  747f             je 0x130                                 
  06bd:00b1  837e0601         cmp word ptr [bp + 6], 1                 
  06bd:00b5  749c             je 0x53                                  
  06bd:00b7  837e0602         cmp word ptr [bp + 6], 2                 
  06bd:00bb  74a5             je 0x62                                  
  06bd:00bd  837e0604         cmp word ptr [bp + 6], 4                 
  06bd:00c1  74ae             je 0x71                                  
  06bd:00c3  837e060a         cmp word ptr [bp + 6], 0xa               
  06bd:00c7  74b7             je 0x80                                  
  06bd:00c9  837e0603         cmp word ptr [bp + 6], 3                 
  06bd:00cd  743c             je 0x10b                                 
  06bd:00cf  837e060a         cmp word ptr [bp + 6], 0xa               
  06bd:00d3  747b             je 0x150                                 
  06bd:00d5  837e060a         cmp word ptr [bp + 6], 0xa               
  06bd:00d9  7503             jne 0xde                                 
  06bd:00db  e9c000           jmp 0x19e                                
  06bd:00de  837e060a         cmp word ptr [bp + 6], 0xa               
  06bd:00e2  7503             jne 0xe7                                 
  06bd:00e4  e9ac00           jmp 0x193                                
  06bd:00e7  b8001a           mov ax, 0x1a00                           
  06bd:00ea  cd10             int 0x10                                 
  06bd:00ec  3c1a             cmp al, 0x1a                             
  06bd:00ee  7534             jne 0x124                                
  06bd:00f0  80fb07           cmp bl, 7                                
  06bd:00f3  7425             je 0x11a                                 
  06bd:00f5  80fb08           cmp bl, 8                                
  06bd:00f8  7420             je 0x11a                                 
  06bd:00fa  80fb0a           cmp bl, 0xa                              
  06bd:00fd  740c             je 0x10b                                 
  06bd:00ff  80fb0b           cmp bl, 0xb                              
  06bd:0102  7407             je 0x10b                                 
  06bd:0104  80fb0c           cmp bl, 0xc                              
  06bd:0107  7402             je 0x10b                                 
  06bd:0109  eb19             jmp 0x124                                
  06bd:010b  8916a406         mov word ptr [0x6a4], dx                 
  06bd:010f  8916a006         mov word ptr [0x6a0], dx                 
  06bd:0113  b80300           mov ax, 3                                
  06bd:0116  5d               pop bp                                   
  06bd:0117  07               pop es                                   
  06bd:0118  5d               pop bp                                   
  06bd:0119  cb               retf                                     
  06bd:011a  8916a606         mov word ptr [0x6a6], dx                 
  06bd:011e  8916a206         mov word ptr [0x6a2], dx                 
  06bd:0122  eb10             jmp 0x134                                
  06bd:0124  b412             mov ah, 0x12                             
  06bd:0126  b310             mov bl, 0x10                             
  06bd:0128  2bc9             sub cx, cx                               
  06bd:012a  cd10             int 0x10                                 
  06bd:012c  2bc0             sub ax, ax                               
  06bd:012e  e311             jcxz 0x141                               
  06bd:0130  8916a206         mov word ptr [0x6a2], dx                 
  06bd:0134  8916a006         mov word ptr [0x6a0], dx                 
  06bd:0138  b80000           mov ax, 0                                
  06bd:013b  eb6a             jmp 0x1a7                                
  06bd:013d  5d               pop bp                                   
  06bd:013e  07               pop es                                   
  06bd:013f  5d               pop bp                                   
  06bd:0140  cb               retf                                     
  06bd:0141  b800f0           mov ax, 0xf000                           
  06bd:0144  8ec0             mov es, ax                               
  06bd:0146  bb00c0           mov bx, 0xc000                           
  06bd:0149  268b07           mov ax, word ptr es:[bx]                 
  06bd:014c  3c21             cmp al, 0x21                             
  06bd:014e  7537             jne 0x187                                
  06bd:0150  89169a06         mov word ptr [0x69a], dx                 
  06bd:0154  ff0e9606         dec word ptr [0x696]                     
  06bd:0158  813e9406f000     cmp word ptr [0x694], 0xf0               
  06bd:015e  7f04             jg 0x164                                 
  06bd:0160  89169806         mov word ptr [0x698], dx                 
  06bd:0164  813e94067001     cmp word ptr [0x694], 0x170              
  06bd:016a  7c06             jl 0x172                                 
  06bd:016c  837e060a         cmp word ptr [bp + 6], 0xa               
  06bd:0170  7506             jne 0x178                                
  06bd:0172  89169c06         mov word ptr [0x69c], dx                 
  06bd:0176  eb26             jmp 0x19e                                
  06bd:0178  8916a006         mov word ptr [0x6a0], dx                 
  06bd:017c  89169e06         mov word ptr [0x69e], dx                 
  06bd:0180  b80a00           mov ax, 0xa                              
  06bd:0183  5d               pop bp                                   
  06bd:0184  07               pop es                                   
  06bd:0185  5d               pop bp                                   
  06bd:0186  cb               retf                                     
  06bd:0187  bad403           mov dx, 0x3d4                            
  06bd:018a  90               nop                                      
  06bd:018b  0e               push cs                                  
  06bd:018c  e82900           call 0x1b8                               -> 06bd:01b8
  06bd:018f  7202             jb 0x193                                 
  06bd:0191  eb0b             jmp 0x19e                                
  06bd:0193  c706a8060100     mov word ptr [0x6a8], 1                  
  06bd:0199  b80a00           mov ax, 0xa                              
  06bd:019c  eb09             jmp 0x1a7                                
  06bd:019e  b80a00           mov ax, 0xa                              
  06bd:01a1  c706aa060100     mov word ptr [0x6aa], 1                  
  06bd:01a7  833e960607       cmp word ptr [0x696], 7                  
  06bd:01ac  7c06             jl 0x1b4                                 
  06bd:01ae  c70696060700     mov word ptr [0x696], 7                  
  06bd:01b4  5d               pop bp                                   
  06bd:01b5  07               pop es                                   
  06bd:01b6  5d               pop bp                                   
  06bd:01b7  cb               retf                                     
  06bd:01b8  b00f             mov al, 0xf                              
  06bd:01ba  ee               out dx, al                               
  06bd:01bb  42               inc dx                                   
  06bd:01bc  ec               in al, dx                                
  06bd:01bd  8ae0             mov ah, al                               
  06bd:01bf  b066             mov al, 0x66                             
  06bd:01c1  ee               out dx, al                               
  06bd:01c2  b90001           mov cx, 0x100                            
  06bd:01c5  e2fe             loop 0x1c5                               
  06bd:01c7  ec               in al, dx                                
  06bd:01c8  86e0             xchg al, ah                              
  06bd:01ca  ee               out dx, al                               
  06bd:01cb  80fc66           cmp ah, 0x66                             
  06bd:01ce  7401             je 0x1d1                                 
