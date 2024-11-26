<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Becas</title>
    <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        display: flex;
        height: 100vh;
        background-color: #f4f4f9;
    }

    /* Sidebar */
    .sidebar {
        width: 250px;
        background-color: #2d3e50;
        color: #fff;
        display: flex;
        flex-direction: column;
    }

    .sidebar h2 {
        text-align: center;
        margin: 20px 0;
        font-size: 18px;
    }

    .menu-item {
        padding: 15px 20px;
        cursor: pointer;
        border-bottom: 1px solid #3c4e62;
    }

    .menu-item:hover {
        background-color: #3c4e62;
    }

    .submenu {
        background-color: #3c4e62;
        display: none;
        padding-left: 20px;
    }

    .submenu a {
        display: block;
        padding: 10px 20px;
        color: #fff;
        text-decoration: none;
    }

    .submenu a:hover {
        background-color: #4c5e72;
    }

    .active+.submenu {
        display: block;
    }

    /* Main Content */
    .main-content {
        flex: 1;
        padding: 20px;
    }

    .stage {
        margin-bottom: 20px;
    }

    .stage h3 {
        margin-bottom: 10px;
        color: #333;
    }

    .card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 15px;
        margin-bottom: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .actions button {
        margin-right: 10px;
        padding: 8px 15px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    .accept {
        background-color: #4CAF50;
        color: #fff;
    }

    .reject {
        background-color: #f44336;
        color: #fff;
    }
    </style>
</head>

<body>
    <?php
  // Configuración de las becas y sus etapas
  $becas = [
      "Alimenticia" => ["Etapa 1", "Etapa 2", "Etapa 3"],
      "Aprovechamiento" => ["Etapa 1", "Etapa 2", "Etapa 3"],
      "EGEL" => ["Etapa 1", "Etapa 2", "Etapa 3"],
      "Hijos de Trabajadores" => ["Etapa 1", "Etapa 2", "Etapa 3"]
  ];
  ?>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Becas</h2>
        <?php foreach ($becas as $beca => $etapas): ?>
        <div class="menu-item" onclick="toggleMenu(this)"><?php echo $beca; ?></div>
        <div class="submenu">
            <?php foreach ($etapas as $etapa): ?>
            <a href="?beca=<?php echo urlencode($beca); ?>&etapa=<?php echo urlencode($etapa); ?>">
                <?php echo $etapa; ?>
            </a>
            <?php endforeach; ?>
        </div>
        <?php endforeach; ?>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <?php
    // Obtener beca y etapa seleccionada
    $becaSeleccionada = $_GET['beca'] ?? null;
    $etapaSeleccionada = $_GET['etapa'] ?? null;

    if ($becaSeleccionada && $etapaSeleccionada):
    ?>
        <div class="stage">
            <h3><?php echo htmlspecialchars($becaSeleccionada) . " - " . htmlspecialchars($etapaSeleccionada); ?></h3>
            <div class="card">
                <?php if ($etapaSeleccionada === "Etapa 1"): ?>
                <p>Lista de quienes subieron la documentación adecuada.</p>
                <?php elseif ($etapaSeleccionada === "Etapa 2"): ?>
                <p>Revisar la documentación.</p>
                <div class="actions">
                    <button class="accept">Aceptar</button>
                    <button class="reject">Rechazar</button>
                </div>
                <?php elseif ($etapaSeleccionada === "Etapa 3"): ?>
                <p>Listado de aceptados por tipo de beca.</p>
                <?php endif; ?>
            </div>
        </div>
        <?php else: ?>
        <div class="stage">
            <h3>Selecciona una beca y una etapa para comenzar.</h3>
        </div>
        <?php endif; ?>
    </div>

    <script>
    function toggleMenu(element) {
        element.classList.toggle("active");
    }
    </script>
</body>

</html>