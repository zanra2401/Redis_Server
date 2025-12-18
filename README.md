# Redis Server untuk Veritas Project

Redis server untuk message broker sinkronisasi real-time antara ServerDaerah dan ServerPusat.

## Quick Start

### Windows
```powershell
.\start-redis.bat
```

### Linux
```bash
chmod +x start-redis.sh test-redis.sh
./start-redis.sh
```

### Manual Start
```powershell
# Windows
.\redis-server.exe redis.conf
```

```bash
# Linux
redis-server redis.conf
```

### Install Redis on Linux
```bash
sudo apt-get update && sudo apt-get install -y redis-server redis-tools
```

## Configuration

Edit `redis.conf` untuk custom configuration:
- Port: 6379 (default)
- Max Memory: 256mb
- Password: (kosongkan untuk development)

## Commands

**Start Redis:**
```powershell
.\start-redis.bat
```

**Stop Redis:**
```powershell
Ctrl+C di terminal Redis
```

**Check Status:**
```powershell
redis-cli ping
# Expected: PONG
```

## Monitoring

**Check Pub/Sub Channels:**
```powershell
redis-cli PUBSUB CHANNELS
```

**Monitor All Commands:**
```powershell
redis-cli MONITOR
```

**View Active Connections:**
```powershell
redis-cli CLIENT LIST
```

## Troubleshooting

**Port Already in Use:**
```powershell
# Check process using port 6379
netstat -ano | findstr :6379

# Kill process
taskkill /PID <PID> /F
```

```bash
# Linux: check process using port 6379
lsof -i :6379

# Kill process (replace <PID>)
sudo kill -9 <PID>
```

**Redis Not Responding:**
```powershell
# Restart Redis
.\start-redis.bat
```

## Notes

- Redis data disimpan di memory (development mode)
- Untuk production, enable persistence di redis.conf
- Log file: redis.log
