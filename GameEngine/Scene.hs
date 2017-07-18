module GameEngine.Scene
  ( module GameEngine.Graphics.Frustum
  , module Data.Vect.Float.Util.Quaternion
  , Renderable(..)
  , Picture(..)
  , Camera(..)
  , Scene(..)
  , Resource(..)
  ) where

import Data.Vect
import System.FilePath
import Data.Vect.Float.Util.Quaternion
import GameEngine.Graphics.Frustum

type Position = Vec3
type Orientation = UnitQuaternion
type RGBA = Vec4
type SkinName = String
type ShaderName = String

data Renderable
  = MD3             Position Orientation RGBA FilePath
  | MD3Character    Position Orientation RGBA FilePath SkinName
  | BSPInlineModel  Position Orientation RGBA FilePath Int
  | BSPMap          FilePath
  deriving Show

data Camera
  = Camera
  { cameraPosition      :: Position
  , cameraOrientation   :: Orientation
  , cameraProjection    :: Mat4
  , cameraFrustum       :: Frustum
  , cameraViewportSize  :: (Int,Int)
  -- add viewport position
  } deriving Show

data Scene
  = Scene
  { renderables :: [Renderable]
  , pictures    :: [Picture]
  , camera      :: Camera
  -- add shader time
  } deriving Show

data Resource
  = R_MD3             FilePath
  | R_MD3Character    FilePath SkinName
  | R_BSPMap          FilePath
  deriving (Eq, Show)

data Picture
  = Picture
  { picturePosition :: Vec2
  , pictureSize     :: Vec2
  , pictureUV1      :: Vec2
  , pictureUV2      :: Vec2
  , pictureColor    :: RGBA
  , pictureShader   :: ShaderName
  } deriving Show
