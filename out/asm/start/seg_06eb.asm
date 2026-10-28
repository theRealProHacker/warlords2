; seg 06eb  img 0x6eb0..0x6f70  file off 0x7ab0
  06eb:0000  c9               leave                                    
  06eb:0001  cb               retf                                     
  06eb:0002  b80000           mov ax, 0                                
  06eb:0005  a3b006           mov word ptr [0x6b0], ax                 
  06eb:0008  a3b206           mov word ptr [0x6b2], ax                 
  06eb:000b  cd33             int 0x33                                 
  06eb:000d  cb               retf                                     

proc_06eb_000e:
  06eb:000e  55               push bp                                  
  06eb:000f  8bec             mov bp, sp                               
  06eb:0011  06               push es                                  
  06eb:0012  57               push di                                  
  06eb:0013  53               push bx                                  
  06eb:0014  51               push cx                                  
  06eb:0015  52               push dx                                  
  06eb:0016  b80300           mov ax, 3                                
  06eb:0019  cd33             int 0x33                                 
  06eb:001b  8bc3             mov ax, bx                               
  06eb:001d  8bd9             mov bx, cx                               
  06eb:001f  8a0ed815         mov cl, byte ptr [0x15d8]                
  06eb:0023  d3fb             sar bx, cl                               
  06eb:0025  891e7808         mov word ptr [0x878], bx                 
  06eb:0029  8bda             mov bx, dx                               
  06eb:002b  891e7a08         mov word ptr [0x87a], bx                 
  06eb:002f  5a               pop dx                                   
  06eb:0030  59               pop cx                                   
  06eb:0031  5b               pop bx                                   
  06eb:0032  5f               pop di                                   
  06eb:0033  07               pop es                                   
  06eb:0034  5d               pop bp                                   
  06eb:0035  cb               retf                                     

proc_06eb_0036:
  06eb:0036  55               push bp                                  
  06eb:0037  8bec             mov bp, sp                               
  06eb:0039  b80f00           mov ax, 0xf                              
  06eb:003c  8b4e06           mov cx, word ptr [bp + 6]                
  06eb:003f  8b5608           mov dx, word ptr [bp + 8]                
  06eb:0042  cd33             int 0x33                                 
  06eb:0044  5d               pop bp                                   
  06eb:0045  cb               retf                                     

proc_06eb_0046:
  06eb:0046  55               push bp                                  
  06eb:0047  8bec             mov bp, sp                               
  06eb:0049  b80400           mov ax, 4                                
  06eb:004c  8b4e06           mov cx, word ptr [bp + 6]                
  06eb:004f  8b5608           mov dx, word ptr [bp + 8]                
  06eb:0052  cd33             int 0x33                                 
  06eb:0054  5d               pop bp                                   
  06eb:0055  cb               retf                                     
  06eb:0056  b80b00           mov ax, 0xb                              
  06eb:0059  cd33             int 0x33                                 
  06eb:005b  890e7c08         mov word ptr [0x87c], cx                 
  06eb:005f  89167e08         mov word ptr [0x87e], dx                 
  06eb:0063  b80000           mov ax, 0                                
  06eb:0066  cb               retf                                     

proc_06eb_0067:
  06eb:0067  55               push bp                                  
  06eb:0068  8bec             mov bp, sp                               
  06eb:006a  b80700           mov ax, 7                                
  06eb:006d  8b4e06           mov cx, word ptr [bp + 6]                
  06eb:0070  8b560a           mov dx, word ptr [bp + 0xa]              
  06eb:0073  cd33             int 0x33                                 
  06eb:0075  b80800           mov ax, 8                                
  06eb:0078  8b4e08           mov cx, word ptr [bp + 8]                
  06eb:007b  8b560c           mov dx, word ptr [bp + 0xc]              
  06eb:007e  cd33             int 0x33                                 
  06eb:0080  5d               pop bp                                   
  06eb:0081  cb               retf                                     

proc_06eb_0082:
  06eb:0082  55               push bp                                  
  06eb:0083  8bec             mov bp, sp                               
  06eb:0085  837e0600         cmp word ptr [bp + 6], 0                 
  06eb:0089  7505             jne 0x90                                 
  06eb:008b  b80200           mov ax, 2                                
  06eb:008e  eb03             jmp 0x93                                 
  06eb:0090  b80100           mov ax, 1                                
  06eb:0093  cd33             int 0x33                                 
  06eb:0095  5d               pop bp                                   
  06eb:0096  cb               retf                                     

proc_06eb_0097:
  06eb:0097  55               push bp                                  
  06eb:0098  8bec             mov bp, sp                               
  06eb:009a  8b4e06           mov cx, word ptr [bp + 6]                
  06eb:009d  8b5608           mov dx, word ptr [bp + 8]                
  06eb:00a0  8b460a           mov ax, word ptr [bp + 0xa]              
  06eb:00a3  8ec0             mov es, ax                               
  06eb:00a5  b80900           mov ax, 9                                
  06eb:00a8  cd33             int 0x33                                 
  06eb:00aa  5d               pop bp                                   
  06eb:00ab  cb               retf                                     
  06eb:00ac  b80000           mov ax, 0                                
  06eb:00af  cd33             int 0x33                                 
  06eb:00b1  bb0100           mov bx, 1                                
  06eb:00b4  b90100           mov cx, 1                                
  06eb:00b7  8cd8             mov ax, ds                               
  06eb:00b9  8ec0             mov es, ax                               
  06eb:00bb  bab406           mov dx, 0x6b4                            
  06eb:00be  b8               db b8
  06eb:00bf  09               db 09
