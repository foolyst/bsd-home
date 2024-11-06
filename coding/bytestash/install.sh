#!/bin/sh

# Step 1: Navigate to the target directory
cd /usr/local/share || { echo "Failed to cd to /usr/local/share"; exit 1; }

# Step 2: Clone the ByteStash repository
git clone https://github.com/jordan-dalby/ByteStash.git || { echo "Failed to clone repository"; exit 1; }

# Step 3: Navigate to the client directory
cd /usr/local/share/ByteStash/client || { echo "Failed to cd to /usr/local/share/ByteStash/client"; exit 1; }

# Step 4: Install dependencies for the client using pnpm
pnpm install || { echo "Failed to run pnpm install in client"; exit 1; }

# Step 5: Build the client using pnpm
pnpm build || { echo "Failed to run pnpm build in client"; exit 1; }

# Step 6: Navigate to the server directory
cd /usr/local/share/ByteStash/server || { echo "Failed to cd to /usr/local/share/ByteStash/server"; exit 1; }

# Step 7: Install production dependencies for the server
pnpm install --production || { echo "Failed to run pnpm install --production in server"; exit 1; }

# Step 8: Start the server using pnpm, run it in the background with nohup
nohup pnpm start & || { echo "Failed to start the server"; exit 1; }

echo "ByteStash setup and server started successfully!"
