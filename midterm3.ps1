Install-Module –Name ImportExcel
Install-Module -Name ImportExcel -Scope CurrentUser
$Inventory = @(
        [PSCustomObject]@{ Item = "Table"; Quantity = 12 }
        [PSCustomObject]@{ Item = "Chair"; Quantity = 30 }
        [PSCustomObject]@{ Item = "Sofa"; Quantity = 5 }
        [PSCustomObject]@{ Item = "Coffee Table"; Quantity = 10 }
)
$Inventory | Export-Excel -Path "C:\Path\To\FurnitureInventory.xlsx" -WorksheetName "ShopInventory"
$ImportedInventory = Import-Excel -Path "C:\Path\To\FurnitureInventory.xlsx" -OutVariable ShopInvetory

#This will list the inventory
$ImportedInventory

#Item       Quantity
Table           12.00
Chair           30.00
Sofa             5.00
Coffee Table    10.00