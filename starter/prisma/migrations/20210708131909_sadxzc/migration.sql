-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "courierId" TEXT,
    "userId" TEXT NOT NULL,
    "deliveryLocationLat" INTEGER NOT NULL,
    "deliveryLocationLng" INTEGER NOT NULL,
    "updatedAt" DATETIME NOT NULL,
    FOREIGN KEY ("courierId") REFERENCES "Courier" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Order" ("courierId", "deliveryLocationLat", "deliveryLocationLng", "id", "updatedAt", "userId") SELECT "courierId", "deliveryLocationLat", "deliveryLocationLng", "id", "updatedAt", "userId" FROM "Order";
DROP TABLE "Order";
ALTER TABLE "new_Order" RENAME TO "Order";
CREATE TABLE "new_Courier" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "connection" TEXT,
    "locationLat" INTEGER NOT NULL,
    "locationLng" INTEGER NOT NULL,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Courier" ("connection", "id", "locationLat", "locationLng", "updatedAt") SELECT "connection", "id", "locationLat", "locationLng", "updatedAt" FROM "Courier";
DROP TABLE "Courier";
ALTER TABLE "new_Courier" RENAME TO "Courier";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
