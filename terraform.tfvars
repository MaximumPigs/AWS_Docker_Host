# provider information

key_pair = "MaximumPigs_Key_Pair"

# dns routes

routes = [
  { name = "maximumpigs.com", type = "A", records = ["${aws_eip.public.public_ip}"] },
  { name = "www", type = "CNAME", records = null }
]