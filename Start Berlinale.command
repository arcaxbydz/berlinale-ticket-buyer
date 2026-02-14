#!/bin/bash
# ============================================
#   Berlinale 2026 Ticket Buyer
# ============================================

cd "$(dirname "$0")"

# Kill any existing server on port 8000
lsof -ti:8000 | xargs kill 2>/dev/null

# Clean up browser lock
rm -f data/browser_profile/SingletonLock 2>/dev/null

echo "========================================"
echo "  🎬 Berlinale 2026 Ticket Buyer"
echo "========================================"
echo ""
echo "  Server: http://localhost:8000"
echo "  Press Ctrl+C to stop"
echo ""

# Open browser after server starts
(sleep 3 && open "http://localhost:8000") &

# Start the server
python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --log-level info
