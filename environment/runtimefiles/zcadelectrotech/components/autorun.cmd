;Комментарий
;*-путь к программе
;-------------------
;Загрузка УГО блоков
;-------------------
;Сейчас вместо непосредственной загрузки
;файлов с определениями блоков (комманда  MergeBlocks)
;использую загрузку файла с перечнем блоков - где они
;определены и от каких блоков зависят (комманда  ReadBlockLibrary)
;непосредственная загрузка блоков происходит при
;необходимости, с учетом зависимостей
;ReadBlockLibrary(zcadblocks.lst)
MergeBlocks(_sys.dxf)
MergeBlocks(_connector.dxf)
MergeBlocks(_el.dxf)
MergeBlocks(_nok.dxf)
MergeBlocks(_OPS.dxf)
MergeBlocks(_KIP.dxf)
MergeBlocks(_ss.dxf)
MergeBlocks(_spds.dxf)
MergeBlocks(_vl_diagram.dxf)
MergeBlocks(_vl_el.dxf)
MergeBlocks(_vl_line.dxf)
MergeBlocks(_vl_ops.dxf)
MergeBlocks(_vl_table.dxf)
MergeBlocks(_vl_unit.dxf)
MergeBlocks(_vl_high_voltage.dxf)
MergeBlocks(_velec_diagram.dxf)

;------------------------
;Создание пустого чертежа
;------------------------
;DWGNew

;------------------------
;Загрузка ткстовых файлов
;------------------------
;Load(*sample/test_dxf/teapot.dxf)
;Load(*sample/test_dxf/em.dxf)
;Load(*autosave/autosave.dxf)
;Load(*sample/zigzag.dxf)

;-----------------------------------
;Показ окна "О программе" при старте
;-----------------------------------
;About
