; res_0ec0 file_off 0x10c00

res_0ec0_0002:  ; ENTRY
  0002  b80000           mov ax, 0                                
  0005  a38e33           mov word ptr [0x338e], ax                
  0008  a39033           mov word ptr [0x3390], ax                
  000b  cd33             int 0x33                                 
  000d  cb               retf                                     

res_0ec0_000e:  ; ENTRY
  000e  55               push bp                                  
  000f  8bec             mov bp, sp                               
  0011  06               push es                                  
  0012  57               push di                                  
  0013  53               push bx                                  
  0014  51               push cx                                  
  0015  52               push dx                                  
  0016  b80300           mov ax, 3                                
  0019  cd33             int 0x33                                 
  001b  8bc3             mov ax, bx                               
  001d  8bd9             mov bx, cx                               
  001f  8a0eb669         mov cl, byte ptr [0x69b6]                
  0023  d3fb             sar bx, cl                               
  0025  891e6035         mov word ptr [0x3560], bx                
  0029  8bda             mov bx, dx                               
  002b  891e6235         mov word ptr [0x3562], bx                
  002f  5a               pop dx                                   
  0030  59               pop cx                                   
  0031  5b               pop bx                                   
  0032  5f               pop di                                   
  0033  07               pop es                                   
  0034  5d               pop bp                                   
  0035  cb               retf                                     

res_0ec0_0036:  ; ENTRY
  0036  55               push bp                                  
  0037  8bec             mov bp, sp                               
  0039  b80f00           mov ax, 0xf                              
  003c  8b4e06           mov cx, word ptr [bp + 6]                
  003f  8b5608           mov dx, word ptr [bp + 8]                
  0042  cd33             int 0x33                                 
  0044  5d               pop bp                                   
  0045  cb               retf                                     

res_0ec0_0046:  ; ENTRY
  0046  55               push bp                                  
  0047  8bec             mov bp, sp                               
  0049  b80400           mov ax, 4                                
  004c  8b4e06           mov cx, word ptr [bp + 6]                
  004f  8b5608           mov dx, word ptr [bp + 8]                
  0052  cd33             int 0x33                                 
  0054  5d               pop bp                                   
  0055  cb               retf                                     

res_0ec0_0056:  ; ENTRY
  0056  b80b00           mov ax, 0xb                              
  0059  cd33             int 0x33                                 
  005b  890e6435         mov word ptr [0x3564], cx                
  005f  89166635         mov word ptr [0x3566], dx                
  0063  b80000           mov ax, 0                                
  0066  cb               retf                                     

res_0ec0_0067:  ; ENTRY
  0067  55               push bp                                  
  0068  8bec             mov bp, sp                               
  006a  b80700           mov ax, 7                                
  006d  8b4e06           mov cx, word ptr [bp + 6]                
  0070  8b560a           mov dx, word ptr [bp + 0xa]              
  0073  cd33             int 0x33                                 
  0075  b80800           mov ax, 8                                
  0078  8b4e08           mov cx, word ptr [bp + 8]                
  007b  8b560c           mov dx, word ptr [bp + 0xc]              
  007e  cd33             int 0x33                                 
  0080  5d               pop bp                                   
  0081  cb               retf                                     
  0082  55               push bp                                  
  0083  8bec             mov bp, sp                               
  0085  837e0600         cmp word ptr [bp + 6], 0                 
  0089  7505             jne 0x90                                 
  008b  b80200           mov ax, 2                                
  008e  eb03             jmp 0x93                                 
  0090  b80100           mov ax, 1                                
  0093  cd33             int 0x33                                 
  0095  5d               pop bp                                   
  0096  cb               retf                                     
  0097  55               push bp                                  
  0098  8bec             mov bp, sp                               
  009a  8b4e06           mov cx, word ptr [bp + 6]                
  009d  8b5608           mov dx, word ptr [bp + 8]                
  00a0  8b460a           mov ax, word ptr [bp + 0xa]              
  00a3  8ec0             mov es, ax                               
  00a5  b80900           mov ax, 9                                
  00a8  cd33             int 0x33                                 
  00aa  5d               pop bp                                   
  00ab  cb               retf                                     
  00ac  b80000           mov ax, 0                                
  00af  cd33             int 0x33                                 
  00b1  bb0100           mov bx, 1                                
  00b4  b90100           mov cx, 1                                
  00b7  8cd8             mov ax, ds                               
  00b9  8ec0             mov es, ax                               
  00bb  ba9233           mov dx, 0x3392                           
  00be  b80900           mov ax, 9                                
  00c1  cd33             int 0x33                                 
  00c3  b80100           mov ax, 1                                
  00c6  cd33             int 0x33                                 
  00c8  cb               retf                                     
  00c9  55               push bp                                  
