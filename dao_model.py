from flask import Flask
from sqlalchemy import Column, String, Integer, DateTime, BigInteger, Boolean, Float, func
from sqlalchemy.orm import relationship, backref, sessionmaker
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Material(Base):
    __tablename__ = 'materials'
    material_id = Column(BigInteger, primary_key=True)
    name = Column(String(160), nullable=False)
    type = Column(String(160))
    spec = Column(String(255))
    brand = Column(String(255))
    unit = Column(String(80), nullable=False)
    unit_price = Column(Float, nullable=False)
    comments = Column(String(2000))
    status = Column(Boolean, nullable=False, default=True)


class Plan(Base):
    __tablename__ = 'plans'
    plan_id = Column(BigInteger, primary_key=True)
    name = Column(String(160), nullable=False)
    section_relation = Column(String(160))
    description = Column(String(2000))
    footer = Column(String(2000))
    comments = Column(String(2000))
    status = Column(Boolean, nullable=False, default=True)


class Section(Base):
    __tablename__ = 'sections'
    section_id = Column(BigInteger, primary_key=True)
    name = Column(String(2000), nullable=False)
    description = Column(String(2000), nullable=False)
    plan_id = Column(BigInteger, nullable=False)
    layer = Column(Integer, nullable=False)
    sequence = Column(Integer, nullable=False)
    status = Column(Boolean, nullable=False, default=True)


class SectionMaterial(Base):
    __tablename__ = 'section_materials'
    section_material_id = Column(BigInteger, primary_key=True)
    section_id = Column(BigInteger, nullable=False)
    material_id = Column(BigInteger, nullable=False)
    sequence = Column(Integer, nullable=False)
    default_quantity = Column(Integer, nullable=False)
    priority = Column(Integer, nullable=False)
    is_fixed_amount = Column(Boolean, nullable=False, default=True)
    status = Column(Boolean, nullable=False, default=True)
