<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="framework/datatables/media/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="framework/datatables/media/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="framework/datatables/media/js/jquery.dataTables.js"></script>

<!-- DataTables, TableTools and Editor CSS -->
<link rel="stylesheet" type="text/css" href="framework/datatables/media/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="framework/datatables/extensions/TableTools/css/dataTables.tableTools.css">
<link rel="stylesheet" type="text/css" href="framework/datatables/extensions/Editor-1.3.3/css/dataTables.editor.css">

<!-- jQuery, DataTables, TableTools and Editor Javascript -->
<script type="text/javascript" src="framework/datatables/media/js/jquery.js"></script>
<script type="text/javascript" src="framework/datatables/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="framework/datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
<script type="text/javascript" src="framework/datatables/extensions/Editor-1.3.3/js/dataTables.editor.js"></script>

<!-- Framework colorbox (cajas modales) -->
<link rel="stylesheet" href="framework/colorbox/example1/colorbox.css" />

<script src="framework/colorbox/jquery.colorbox.js"></script>


<form name="formAsociarUsuario" id="formAsociarUsuario" method="POST" action="#">

    Seleccionar Usuario<select name="cmbUsuario" id="cmbUsuario">
        <option value = 0> Usuario por defecto</option>
        <option value = 1> Usuario por defecto1</option>
        <option value = 2> Usuario por defecto2</option>
        <option value = 3> Usuario por defecto3</option>
        <option value = 4> Usuario por defecto4</option>

    </select>
    Seleccionar Grupo de trabajo <select name ="cmbGrupos" id="cmbGrupos">
    <option value = 0> Grupo por defecto</option>
    <option value = 1> Grupo por defecto1</option>
    <option value = 2> Grupo por defecto2</option>
    <option value = 3> Grupo por defecto3</option>
    <option value = 4> Grupo por defecto4</option>
    </select>
    </br>
    </br>
    <input type="submit" name="asociarUsuario" id="asociarUsuario">
</form>
