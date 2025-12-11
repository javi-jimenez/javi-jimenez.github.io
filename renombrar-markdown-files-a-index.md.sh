#!/bin/bash

# Script CORREGIDO para migrar a estructura index.md
echo "🚀 Iniciando migración a estructura estándar index.md..."
echo "=========================================================="

# Contadores
total_migrated=0
total_errors=0

# Usar array para evitar problemas de scope
directories=()
while IFS= read -r -d '' dir; do
    directories+=("$dir")
done < <(find posts/ -type d -print0)

for dir in "${directories[@]}"; do
    if [ -n "$(ls -A "$dir" 2>/dev/null)" ]; then
        dir_name=$(basename "$dir")
        md_file="$dir/$dir_name.md"
        
        # DEBUG: Mostrar qué está buscando
        # echo "Buscando: $md_file"
        
        if [ -f "$md_file" ]; then
            echo "📁 Procesando: $dir_name"
            
            # Verificar si ya existe index.md
            if [ -f "$dir/index.md" ]; then
                echo "   ⚠️  Ya existe index.md, haciendo backup..."
                backup_file="$dir/index.md.backup_$(date +%s)"
                mv "$dir/index.md" "$backup_file"
                echo "   📦 Backup: $(basename "$backup_file")"
            fi
            
            # Renombrar el archivo
            if mv "$md_file" "$dir/index.md"; then
                echo "   ✅ Renombrado: $dir_name.md → index.md"
                ((total_migrated++))
            else
                echo "   ❌ Error renombrando $dir_name.md"
                ((total_errors++))
            fi
            echo ""
        fi
    fi
done

echo "=========================================================="
echo "📊 RESUMEN FINAL:"
echo "   ✅ Archivos migrados: $total_migrated"
echo "   ❌ Errores: $total_errors"
echo "🎉 ¡Proceso completado!"

