--snippets
local ls=require("luasnip")
local t = ls.text_node
local snippet = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets("all",{
  -- basic, don't need to know anything else
  --    arg 1: string
  --    arg 2: a node
  snippet("simple", t "wow, you were right again!"),
}
)

local python_snippets={
  snippet("path1", t "from pathlib import Path"),
  snippet("ezcc",
          fmt( [[
              with ez_spark.cache_config({{'checkpoint_prefix':'{}','use_cache':True}}):
              ]],
              { i(1, 'checkpoint_prefix_str')}
              )
          ),
  snippet("ezkdir",
          fmt(
                [[
                import sys 
                sys.path.insert(0,'/data/ebay/data/glavee/{}')
                ]],
              { i(1, 'repos/sd_data_recipes/src')}
             )
          ),
  snippet("np", t "import numpy as np"),
  snippet("F", t "import pyspark.sql.functions as F"),
  snippet("pd", t "import pandas as pd"),
  snippet("ezs",
          t {
              "import ez_spark",
              "spark,sc = ez_spark.start(ez_spark.QUEUE_STRUCTURED_DATA_DEFAULT)"
            }
         ),
}

ls.add_snippets("python",python_snippets)
